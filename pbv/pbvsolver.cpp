#include <iostream>
#include <utility>
#include <vector>
#include <unordered_map>

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
int postwalk = 0;
int produce_model = 0;
int type_check = 0;
string test = "";


void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << "\t-h / --help\t\tprint help command line arrgument on screen." << endl;
        cout << "\t-d / --debug\t\tprint debug on screen." << endl;
        cout << "\t--pbvsolver\tuse default piand PBVSolver." << endl;
        cout << "\t-c / --comb\tuse PBVSolver with combaine (default)." << endl;
        cout << "\t-f / --full\tuse PBVSolver with full." << endl;
        cout << "\t-p / --partial\tuse PBVSolver with partial." << endl;
        cout << "\t-w / --postwalk\tuse postwalk to optimize your benchmark." << endl;
        cout << "\t--produce-model\tuse produce model solver." << endl;
        cout << "\t-t / --type-check\ttype checking before solving formula." << endl;
        //cout << "\t--pbv\tpbvsolver" << endl;
      } else if (!(*i).compare("-d") ||  !(*i).compare("--debug")) {
        debug = 1;
      } else if (!(*i).compare("--pbvsolver")) {
        pbvsolver = 0; // efficient pbvsolver
      }  else if (!(*i).compare("-c") ||  !(*i).compare("--comb")) {
        pbvsolver = 1; // combine
      } else if (!(*i).compare("-f") ||  !(*i).compare("--full")) {
        pbvsolver = 2; // full
      }  else if (!(*i).compare("-p") ||  !(*i).compare("--partial")) {
        pbvsolver = 3; //partial
      } else if (!(*i).compare("-w") ||  !(*i).compare("--postwalk")) {
        postwalk = 1;
      }  else if (!(*i).compare("--produce-model")) {
        produce_model = 1;
      } else if (!(*i).compare("-t") ||  !(*i).compare("--type-check")) {
        type_check = 1;
      } else if ((*i).length() >= 5 && (*i).compare((*i).length() - 5, 5, ".smt2") == 0) {
        test = (*i);
      } else {
        throw std::runtime_error("Invalid Argument: " + *i + "\n\tplease run again with -h to show valid arguments.");
      }
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
  s = std::make_shared<PBVSolver>(cvc5, debug, pbvsolver, postwalk, 0);
  // solver options
  s->set_opt("nl-ext-tplanes", "true");
  if (pbvsolver != 0) {
    s->set_opt("full-saturate-quant", "true");
  }
  if (produce_model) {
      s->set_opt("produce-models", "true");
  }

  // type checker
  if (type_check) {
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
    switch(pbvsolver){
      case 0: cout << "Piand PBVSolver:" << endl;
        break;
      case 1: cout << "Combine PBVSolver:" << endl;
        break;
      case 2: cout << "Full PBVSolver:" << endl;
        break;
      case 3: cout << "Partial PBVSolver:" << endl;
        break;
      default: break;
    }
  }
  SmtLibReaderTester* reader = new SmtLibReaderTester(s);
  reader->parse(test);
  auto results = reader->get_results();
  cout << results[0] << endl;
  return 0;
}