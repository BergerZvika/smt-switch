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


void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << "\t-h / --help\t\tprint help command line arrgument on screen." << endl;
        cout << "\t-d / --debug\t\tprint debug on screen." << endl;
        cout << "\t-p / --pbvsolver\tuse Efficient PBVSolver." << endl;
        //cout << "\t--pbv\tpbvsolver" << endl;
      } else if (!(*i).compare("-d") ||  !(*i).compare("--debug")) {
        debug = 1;
      } else if (!(*i).compare("-p") ||  !(*i).compare("--pbvsolver")) {
        pbvsolver = 1;
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
  SmtSolver s;
  if (pbvsolver) {
     s = std::make_shared<EfficientPBVSolver>(cvc5, debug);
  }
  else {
    s = std::make_shared<PBVSolver>(cvc5, debug);
  }
  s->set_opt("produce-models", "true");
  SmtLibReaderTester* reader = new SmtLibReaderTester(s);
  reader->parse(test);
  auto results = reader->get_results();
  cout << results[0] << endl;
  return 0;
}
