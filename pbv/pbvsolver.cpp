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
int pbvsolver = 1;
int postwalk = 0;


void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << "\t-h / --help\t\tprint help command line arrgument on screen." << endl;
        cout << "\t-d / --debug\t\tprint debug on screen." << endl;
        cout << "\t--pbvsolver\tuse Efficient PBVSolver." << endl;
        cout << "\t-c / --comb\tuse PBVSolver with comb (default)." << endl;
        cout << "\t-f / --full\tuse PBVSolver with full." << endl;
        cout << "\t-p / --partial\tuse PBVSolver with partial." << endl;
        cout << "\t-w / --postwalk\tuse postwalk to optimize your benchmark." << endl;
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
      }
    }
}



int main(int argc, char** argv){
  parse_args(argc, argv);
    if (help) {
    return 0;
  }
  string test = argv[1];
  if (debug) {
    cout << "test path: " << test << endl;
  }
    SmtSolver cvc5 = Cvc5SolverFactory::create(false);
  // SmtSolver cvc5_1 = Cvc5SolverFactory::create(false);
  // ostream os1(&strbuf1);
  // SmtSolver cvc5 =
  //     create_printing_solver(cvc5_1, &os1, PrintingStyleEnum::DEFAULT_STYLE);
  SmtSolver s;
  if (pbvsolver == 0) {
    if (debug) {
      cout << "EfficientPBVSolver:" << endl;
    }
     s = std::make_shared<EfficientPBVSolver>(cvc5, debug);
  }
  else {
    if (debug) {
      cout << "PBVSolver:" << endl;
    }
    s = std::make_shared<PBVSolver>(cvc5, debug, pbvsolver, postwalk);
  }
  s->set_opt("produce-models", "true");
  s->set_opt("nl-ext-tplanes", "true");
  // s->set_opt("finite-model-find", "true");
  s->set_opt("full-saturate-quant", "true");
  SmtLibReaderTester* reader = new SmtLibReaderTester(s);
  reader->parse(test);
  auto results = reader->get_results();
  cout << results[0] << endl;
  return 0;
}