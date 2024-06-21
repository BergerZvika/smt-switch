#include <iostream>
#include <utility>
#include <vector>
#include <unordered_map>
#include <fstream>
#include <string>
#include <algorithm>
#include <cstdio>
#include <cstdlib>

#include "smt_defs.h"
#include "cvc5_factory.h"
#include "smt.h"
#include "available_solvers.h"
#include "smtlib_reader.h"
#include "pbvsolver.h"

using namespace smt;
using namespace std;
using namespace smt_tests;

class SmtLibReaderTester : public SmtLibReader
{
 public:
  SmtLibReaderTester(SmtSolver & solver) : SmtLibReader(solver) {}

  Result check_sat() override
  {
    Result r = solver_->check_sat();
    // save the result to compare later
    results_.push_back(r);
    return r;
  }

  Result check_sat_assuming(const TermVec & assumptions) override
  {
    Result r = solver_->check_sat_assuming(assumptions);
    // save the result to compare later
    results_.push_back(r);
    return r;
  }

  const vector<Result> & get_results() const { return results_; };

//   Term simplify(const Term& t) {
//     //     cout << "original term: " << t << endl;
// //     Term simp_t = wrapped_solver->simplify(t);
// //     cout << "simplify term: " << simp_t << endl;
// //     return simp_t;
//   }

 protected:
  vector<Result> results_;
};

int help = 0;
int debug = 0;
int pbvsolver = 0;
int postwalk = 1;
int produce_model = 0;
int type_check = 0;
int piand_sum_mode = 1;
int piand_mode = 1;
int difference_lemma = 0;
int translate_smt = 0;
int skolem_lemma = 0;
int nl_cov = 0;
int nl_ext_tplanes = 1;
int cegqi = 0;
int full_saturate = 0;
string test = "";
#define temp_file "temp.txt"

void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << "\t-h / --help\t\tprint help command line arrgument on screen." << endl;
        cout << "\t--pbvsolver\tuse default piand PBVSolver." << endl;
        cout << "\t-c / --comb\tuse PBVSolver with combaine (default)." << endl;
        cout << "\t-f / --full\tuse PBVSolver with full." << endl;
        cout << "\t-p / --partial\tuse PBVSolver with partial." << endl;
        cout << "\t-w / --postwalk\tuse postwalk to optimize your benchmark." << endl;
        cout << "\t-t / --type-check\ttype checking before solving formula." << endl;
        cout << "\t-m / --maxint\tnon pure piand solver, upper bound of bit-width 67108864." << endl;
        cout << "\t--produce-model\tuse produce model solver." << endl;
        cout << "\t--sum-based-lemma\tadd sum based lemma." << endl;
        cout << "\t--sum-ge-based-lemma\tadd sum based lemma ge." << endl;
        cout << "\t--bitwise-based-lemma\tadd bitwised based lemma." << endl;
        cout << "\t--trans\tcreate smt2 file of the translation." << endl;
      } else if (!(*i).compare("-d") ||  !(*i).compare("--debug")) {
        debug = 1;
      } else if (!(*i).compare("--pbvsolver")) {
        pbvsolver = 0; // efficient pbvsolver
      }  else if (!(*i).compare("-c") ||  !(*i).compare("--comb") ||  !(*i).compare("--combine")) {
        pbvsolver = 1; // combine
      } else if (!(*i).compare("-f") ||  !(*i).compare("--full")) {
        pbvsolver = 2; // full
      }  else if (!(*i).compare("-p") ||  !(*i).compare("--partial")) {
        pbvsolver = 3; //partial
      } else if (!(*i).compare("-m") ||  !(*i).compare("--maxint")) {
        pbvsolver = 4; // non pure pbv solver, k <= 67,108,864
      } else if (!(*i).compare("-w") ||  !(*i).compare("--no-postwalk")) { 
        postwalk = 0;
      } else if (!(*i).compare("--produce-model")) {
        produce_model = 1;
      } else if (!(*i).compare("--cigar")) {
        piand_mode = 2;
      } else if (!(*i).compare("--no-cigar")) {
        piand_mode = 3;
      } else if (!(*i).compare("--cvc5-cegqi-all")) {
        cegqi = 1;
      } else if (!(*i).compare("--cvc5-cegqi-full")) {
        cegqi = 2;
      } else if (!(*i).compare("--cvc5-full-saturate")) {
        full_saturate = 1;
      } else if (!(*i).compare("--cvc5-nl-cov")) {
        nl_cov = 1;
      } else if (!(*i).compare("--cvc5-no-nl-ext-tplanes")) {
        nl_ext_tplanes = 0;
      } else if (!(*i).compare("--no-sum-based-lemma")) {
        piand_sum_mode = 0;
      } else if (!(*i).compare("--sum-ge-lemma")) {
        piand_sum_mode = 3;
      } else if (!(*i).compare("--sum-eq-lemma")) {
        piand_sum_mode = 4;
      } else if (!(*i).compare("--bitwise-based-lemma")) {
        piand_sum_mode = 2;
      } else if (!(*i).compare("--difference-lemma")) {
        difference_lemma = 0;
      } else if (!(*i).compare("-s") || !(*i).compare("--skolem-lemmas")) {
        skolem_lemma = 1;
      } else if (!(*i).compare("--trans")) {
        translate_smt = 1;
      } else if (!(*i).compare("-t") ||  !(*i).compare("--type-check")) {
        type_check = 1;
      } else if ((*i).length() >= 5 && (*i).compare((*i).length() - 5, 5, ".smt2") == 0) {
        test = (*i);
      } else {
        throw std::runtime_error("Invalid Argument: " + *i + "\n\tplease run again with -h to show valid arguments.");
      }
  }
}

void create_translate_smt() {
    std::string end = "";
    // output file
    std::string out = test.substr(test.find_last_of("/\\") + 1);
    out = out.substr(0, out.find_last_of(".")) + "_translate.smt2";
    std::ofstream outFile(out);
    if (!outFile) {
        throw std::runtime_error("Unable to create the file: " + out);
    }
    if (pbvsolver) {
      outFile << "(set-logic UFNIA)" << std::endl;
      outFile << "(declare-fun bvand (Int Int Int) Int)" << std::endl;
    } else {
      outFile << "(set-logic ALL)" << std::endl;
    }

    // read the origion file
    std::ifstream origion(test);
    if (!origion) {
        throw std::runtime_error("Unable to open the file: " + test);
    }
    int assert = 0;
    std::string line;
    while (std::getline(origion, line)) {
        size_t bitvec_pos = line.find("_ BitVec");
        size_t logic_pos = line.find("set-logic");
        size_t assert_pos = line.find("assert");
        if (assert_pos != std::string::npos) {
          assert++;
        } else if (logic_pos != std::string::npos) {
           continue;
        } else if (assert) {
          end += line + "\n";
        } else if (bitvec_pos != std::string::npos) {
            // Found "_BitVec" in the line, replace it with "int"
            line = line.substr(0, bitvec_pos - 4) + "Int)";
            // line.replace(bitvec_pos, std::string("(_ BitVec").length(), "Int)");
            size_t declareFunPos = line.find("declare-fun");
            size_t declareConstPos = line.find("declare-const");
            if (declareFunPos != std::string::npos) {
              line.replace(declareFunPos, std::string("declare-fun ").length(), "declare-const _pbv_");
            }
            else if (declareConstPos != std::string::npos) {
              line.replace(declareConstPos, std::string("declare-const ").length(), "declare-const _pbv_");
            }
        }
        if (!assert) {
          outFile << line << std::endl;
        }
    }
    origion.close();

    // read the translate formula
    std::ifstream temp(temp_file);
    if (!temp) {
        throw std::runtime_error(std::string("Unable to open the file: ") + temp_file);
    }
    std::string formula;
    while (std::getline(temp, formula))  {
      outFile << "(assert " << formula << ")" <<  endl;
    }
    outFile << end;

    temp.close();
    outFile.close();
    // remove temp_file
    if (std::remove(temp_file) != 0) {
        throw std::runtime_error(std::string("Unable to open the file: ") + temp_file);
    }
}



int main(int argc, char** argv){
  // parse arguments
  parse_args(argc, argv);
  if (help) {
    return 0;
  }
  if (!test.compare("")) {
    cout << "Missing path to smt2 file!" << endl;
    return 0;
  }
  if (debug) {
    cout << "test path: " << test << endl;
  }

  // create pbvsolver
  SmtSolver s, type_checker;
  SmtSolver cvc5 = Cvc5SolverFactory::create(false);
  s = std::make_shared<PBVSolver>(cvc5, debug, pbvsolver, postwalk, 0, translate_smt);

  // solver options
  if(nl_ext_tplanes) { //implement by default
    s->set_opt("nl-ext-tplanes", "true");
  }
  if(nl_cov) {
    s->set_opt("nl-cov", "true");
  }
  if (full_saturate) { // quantifiers
    s->set_opt("full-saturate-quant", "true"); // cvc5-full-saturate
  }
  if (cegqi == 1) {
    s->set_opt("cegqi-all", "true");
  } else if (cegqi == 2) {
    s->set_opt("cegqi-full", "true");
  }
  if (produce_model) {
      s->set_opt("produce-models", "true");
  }
  //piand mode options
  if (piand_mode == 1) {
    s->set_opt("piand-mode", "piand");
  } else if (piand_mode == 2) {
    s->set_opt("piand-mode", "cigar");
  } else if (piand_mode == 3) {
    s->set_opt("piand-mode", "no-cigar");
  }
  // sum lemma options
  if (piand_sum_mode == 1) {
    s->set_opt("piand-sum-mode", "sum");
  } else if (piand_sum_mode == 2) {
    s->set_opt("piand-sum-mode", "bitwise");
  } else if (piand_sum_mode == 3) {
    s->set_opt("piand-sum-mode", "sum_ge");
  } else if (piand_sum_mode == 4) {
    s->set_opt("piand-sum-mode", "sum_eq");
  } else if (piand_sum_mode == 0) {
    s->set_opt("piand-sum-mode", "difference");
  }
  if(difference_lemma){
    s->set_opt("difference-lemmas", "true");
  }
  if(skolem_lemma) {
    s->set_opt("skolem-lemmas", "true");
  }

  // type checker
  if (type_check) {
    // zero signifies the absence of debugging
    type_checker = std::make_shared<PBVSolver>(Cvc5SolverFactory::create(false), 0, pbvsolver, postwalk, type_check);
    SmtLibReaderTester* type_reader = new SmtLibReaderTester(type_checker);
    type_reader->parse(test);
    auto type_results = type_reader->get_results();
    if (type_results[0].is_unsat()) {
        throw std::runtime_error("Type Checker Error!");
    }
    type_check = 0;
  }
  
  // run solver on test.
  if (debug) {
    switch(pbvsolver) {
      case 0: cout << "Piand PBVSolver:" << endl;
        break;
      case 1: cout << "Combine PBVSolver:" << endl;
        break;
      case 2: cout << "Full PBVSolver:" << endl;
        break;
      case 3: cout << "Partial PBVSolver:" << endl;
        break;
      case 4: cout << "Non-Pure Piand PBVSolver:" << endl;
        break;
      default: break;
    }
  }

  try {
    SmtLibReaderTester* reader = new SmtLibReaderTester(s);
    reader->parse(test);
    if (translate_smt) {
      create_translate_smt();
      return 1;
    }
    auto results = reader->get_results();
    cout << results[0] << endl;
  } catch (std::exception& e) {
    if (std::string(e.what()).find("67108864") != std::string::npos) {
      cout << "unknown" << endl;
    }
     else {
          cout << e.what() << endl;
     }
  }

  return 0;
}