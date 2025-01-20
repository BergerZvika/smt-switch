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

 protected:
  vector<Result> results_;
};

int help = 0;
int debug = 0;
int pbvsolver = 0;
int postwalk = 1;
int bvsub = 0;
int produce_model = 0;
int type_check = 0;
int piand_sum_mode = 1;
int piand_mode = 1;
int difference_lemma = 0;
int translate_smt = 0;
int skolem_lemma = 0;
int simplify = -1;
int after_simplify = 0;
int get_value = 0;
int get_model = 0;
int rewrite = 1;
std::list<string> values;
std::list<string> cvc5_args;
string test = "";

#define temp_file "temp.txt"

int simplifyNumber(const std::string& input) {
    // Check if the input starts with "--simplify="
    const std::string prefix = "--simplify=";
    if (input.rfind(prefix, 0) == 0) {  // Check if input starts with prefix
        std::string numberPart = input.substr(prefix.size());
        try {
            // Convert the number part to an integer
            int number = std::stoi(numberPart);
            return number;
        } catch (const std::invalid_argument&) {
            // Handle the case where conversion fails
            std::cerr << "Invalid format after --simplify=" << std::endl;
            return -1;
        }
    }
    return -1;
}

int cvc5_args_parse(const std::string& input) {
    // Check if the input starts with "--simplify="
    const std::string prefix = "--cvc5:";
    if (input.rfind(prefix, 0) == 0) {  // Check if input starts with prefix
      std::string arg = input.substr(prefix.size());
      cvc5_args.push_back(arg);
      return 1;
    }
    return 0;
}

void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << "\t-h / --help\t\tprint help command line arrgument on screen." << endl;
        cout << "\t-d / --debug\t\tprint to screen debug meeseges at runtime.." << endl;
        cout << "\t--pbvsolver\t\tuse default piand PBVSolver." << endl;
        cout << "\t-c / --comb / --combine\t\tuse PBVSolver with combaine (default)." << endl;
        cout << "\t-f / --full\t\tuse PBVSolver with full." << endl;
        cout << "\t-p / --partial\t\tuse PBVSolver with partial." << endl;
        cout << "\t-w / --no-postwalk\t\tdisable postwalk to optimize your benchmark." << endl;
        cout << "\t-t / --type-check\t\ttype checking before solving formula." << endl;
        cout << "\t-m / --maxint\t\tnon pure piand solver, upper bound of bit-width 67108864." << endl;
        cout << "\t-r / --rewrite\t\tdon't use rewrite rules on pbv formula." << endl;
        cout << "\t-s / --simplify\t\tuse default simplify with bit-width 64." << endl;
        cout << "\t-fs / --false-simplify\t\tuse simplify when simplify get false or true." << endl;
        cout << "\t--simplify={num}\t\tuse simplify with bit-width num." << endl;
        cout << "\t--no-sub\t\ttranslate x-y to x + (-y)." << endl;
        cout << "\t--produce-model\t\tuse produce model solver." << endl;
        cout << "\t--cigar\t\tput all piand lemmas in cigar loop." << endl;
        cout << "\t--no-cigar\t\tput all piand lemmas in initilize." << endl;
        cout << "\t--cvc5:{args}\t\tsend arguments to cvc5 solver. foe example --cvc5:nl-cov or --cvc5:mbqi. you can also send a list of arguments at once --cvc5:\"nl-cov mbqi\"." << endl;
        cout << "\t--no-sum-based-lemma\t\tremove sum based lemma." << endl;
        cout << "\t--sum-eq-lemma\t\tadd sum based lemma eq." << endl;
        cout << "\t--sum-ge-lemma\t\tadd sum based lemma ge." << endl;
        cout << "\t--bitwise-based-lemma\t\tadd bitwised based lemma." << endl;
        cout << "\t--skolem-lemmas\t\tadd skolems lemmas." << endl;
        cout << "\t--trans\t\tcreate smt2 file of the translation." << endl;
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
      } else if (!(*i).compare("--no-sub")) { 
        bvsub = 1;
      } else if (simplifyNumber(*i) >= 0) { 
        simplify = simplifyNumber(*i);
      } else if (!(*i).compare("-s") || !(*i).compare("--simplify")) { 
        simplify = 64;
      } else if (!(*i).compare("-fs") || !(*i).compare("--false-simplify")) {
        if (simplify > 0) {
          simplify = simplify * -1;
        } else {
          simplify = -64;
        }
      } else if (cvc5_args_parse(*i)) {
        continue;
      } else if (!(*i).compare("--produce-model")) {
        produce_model = 1;
      } else if (!(*i).compare("--cigar")) {
        piand_mode = 2;
      } else if (!(*i).compare("--no-cigar")) {
        piand_mode = 3;
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
      } else if (!(*i).compare("--skolem-lemmas")) {
        skolem_lemma = 1;
      } else if (!(*i).compare("--trans")) {
        translate_smt = 1;
      } else if (!(*i).compare("-t") ||  !(*i).compare("--type-check")) {
        type_check = 1;
      } else if (!(*i).compare("-r") ||  !(*i).compare("--rewrite")) {
        rewrite = 0;
      } else if (!(*i).compare("--get-value")) {
        get_value = 1;
      }   else if (!(*i).compare("--get-model")) {
        get_model = 1;
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
    bool isfun = false;
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
          size_t check_pos = line.find("(check");
          size_t get_pos = line.find("(get-");
          size_t set_pos = line.find("(set-");
          size_t exit_pos = line.find("(exit)");
          size_t push_pos = line.find("(push");
          size_t pop_pos = line.find("(pop");
          if (check_pos != std::string::npos || get_pos != std::string::npos || set_pos != std::string::npos || 
              exit_pos != std::string::npos ||  push_pos != std::string::npos || pop_pos != std::string::npos) {
            end += line + "\n";
          }
        } else if (bitvec_pos != std::string::npos) {
            size_t declareFunPos = line.find("declare-fun");
            size_t declareConstPos = line.find("declare-const");
            size_t defineFunPos = line.find("define-fun");
            // Found "_BitVec" in the line, replace it with "int"
            if (declareFunPos != std::string::npos) {
              line = line.substr(0, bitvec_pos - 4) + "Int)";
              line.replace(declareFunPos, std::string("declare-fun ").length(), "declare-const _pbv_");
            }
            else if (declareConstPos != std::string::npos) {
              line = line.substr(0, bitvec_pos - 1) + "Int)";
              line.replace(declareConstPos, std::string("declare-const ").length(), "declare-const _pbv_");
            } else if (defineFunPos != std::string::npos) {
              isfun = true;
              continue;
            } 
        }
        if (!assert && !isfun) {
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
  s = std::make_shared<PBVSolver>(cvc5, debug, pbvsolver, postwalk, 0, translate_smt, bvsub, simplify, rewrite);

  // solver options
  std::size_t equal_pos;
  for (auto arg : cvc5_args) {
    arg.erase(remove(arg.begin(), arg.end(), '\"' ), arg.end());
    size_t pos = 0;
    std::string token;
    while ((pos = arg.find(' ')) != std::string::npos) {
      token = arg.substr(0, pos);
      equal_pos = token.find('=');
      if (equal_pos != std::string::npos) { // Check if '=' is found
          // Split the string into two parts: before and after '='
          std::string key = token.substr(0,equal_pos);         // Before '='
          std::string value = token.substr(equal_pos + 1);       // After '='
          s->set_opt(key, value);
      } else {
          s->set_opt(token, "true");
      }
      arg.erase(0, pos + 1);
    }
    equal_pos = arg.find('=');
    if (equal_pos != std::string::npos) { // Check if '=' is found
      // Split the string into two parts: before and after '='
        std::string key = arg.substr(0,equal_pos);         // Before '='
        std::string value = arg.substr(equal_pos + 1);       // After '='
        s->set_opt(key, value);
    } else {
        s->set_opt(arg, "true");
    }
  }
  if(get_value) {
    s->set_opt("produce-model", "true");
  }
  if(get_model) {
    s->set_opt("produce-model", "true");
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
    s->set_opt("piand-lemmas-mode", "sum");
  } else if (piand_sum_mode == 2) {
    s->set_opt("piand-lemmas-mode", "bitwise");
  } else if (piand_sum_mode == 3) {
    s->set_opt("piand-lemmas-mode", "sum_ge");
  } else if (piand_sum_mode == 4) {
    s->set_opt("piand-lemmas-mode", "sum_eq");
  } else if (piand_sum_mode == 0) {
    s->set_opt("piand-lemmas-mode", "difference");
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
    type_checker = std::make_shared<PBVSolver>(Cvc5SolverFactory::create(false), 0, pbvsolver, postwalk, type_check, translate_smt, bvsub, simplify, rewrite);

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

  // try {
    SmtLibReaderTester* reader = new SmtLibReaderTester(s);
    reader->parse(test);
    if (translate_smt) {
      create_translate_smt();
      return 1;
    } else if(simplify == 0) {
      return 1;
    }
    auto results = reader->get_results();
    cout << results[0] << endl;
  // } catch (std::exception& e) {
  //   if (std::string(e.what()).find("67108864") != std::string::npos) {
  //     cout << "unknown" << endl;
  //   }
  //    else {
  //         cout << e.what() << endl;
  //    }
  // }

  return 0;
}