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

int main(int argc, char** argv){
  string test = argv[1];
  cout << "test path: " << test << endl;
  SmtSolver cvc5 = Cvc5SolverFactory::create(false);
  SmtSolver s = std::make_shared<PBVSolver>(cvc5);
  s->set_opt("produce-models", "true");
  SmtLibReaderTester* reader = new SmtLibReaderTester(s);
  reader->parse(test);
  auto results = reader->get_results();
  cout << results[0] << endl;
  return 0;
}
