#include <utility>
#include <vector>

#include "available_solvers.h"
#include "gtest/gtest.h"
#include "smt.h"
#include "pbvsolver.h"


using namespace smt;
using namespace std;

namespace smt_tests {

class BVModelTests : public ::testing::Test,
                        public ::testing::WithParamInterface<SolverConfiguration>
{
 protected:
  void SetUp() override
  {
    this->smtsolver = create_solver(GetParam());
  }
  SmtSolver smtsolver;
  // PBVSolver* s;
};


TEST_P(BVModelTests, TestPBVTermModel)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k" ,intsort);
  Sort bvsort = s->make_sort(BV, k);
  Term bvterm_x = s->make_pbv_symbol("bv_k", bvsort);
  Term bvterm_y = s->make_pbv_symbol("pbv_k", bvsort);
  Term constraint1 = s->make_term(Equal, bvterm_x, bvterm_x);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestEQModel)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");  
  Sort intsort = s->make_sort(INT);
  Term t = s->make_term(4 ,intsort);
  Term t2 = s->make_term(4 ,intsort);
  ASSERT_EQ(t, t2);

  Term k = s->make_symbol("k" ,intsort);
  Sort bvsort = s->make_sort(BV, k);
  Term bvterm_x = s->make_pbv_symbol("bv_k", bvsort);
  Term bvterm_y = s->make_pbv_symbol("pbv_k", bvsort);
  Term constraint1 = s->make_term(Equal, bvterm_x, bvterm_y);
  Term constraint2 = s->make_term(Equal, bvterm_x, bvterm_y);
  ASSERT_EQ(constraint1, constraint2);
}

TEST_P(BVModelTests, TestTrivialPBV)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Sort bvk = s->make_sort(BV, k);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term formula = s->make_term(Equal, x1, x2);
  s->assert_formula(formula);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

// x1 != x2 != x3 /\ k= 1
TEST_P(BVModelTests, TestRulesPBV)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Sort bvk = s->make_sort(BV, k);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvk);
  Term formula = s->make_term(Distinct, x1, x2, x3);
  Term one = s->make_term(1, intsort);
  Term width = s->make_term(Equal, k, one);
  Term widthAndFormula = s->make_term(And, width, formula);
  Term res = s->translate_term(widthAndFormula);
  cout << res << endl;
  s->assert_formula(res);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_unsat());
}

TEST_P(BVModelTests, TestTrivialTransPBV)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Sort bvk = s->make_sort(BV, k);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term formula = s->make_term(Equal, x1, x2);
  Term res = s->translate_term(formula);
  cout << res << endl;
  s->assert_formula(res);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestIntsortPBV)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term x1 = s->make_symbol("x1", intsort);
  Term x2 = s->make_symbol("x2", intsort);
  Term formula = s->make_term(Equal, x1, x2);
  Term res = s->translate_term(formula);
  TermVec children;
  children.insert(children.begin(), res->begin(), res->end());
  ASSERT_TRUE(children[0]->get_sort() == intsort);
  ASSERT_TRUE(children[1]->get_sort() == intsort);
}

TEST_P(BVModelTests, TestTranslatePBV2)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term four = s->make_term("4", intsort);
  Sort bv4 = s->make_sort(BV, four);
  Term x1 = s->make_pbv_symbol("x1", bv4);
  Term x2 = s->make_pbv_symbol("x2", bv4);
  Term condition = s->make_term(Equal, x1, x2);
  Term x1xorx2 = s->make_term(Xor, x1, x2);
  Term then_branch = x1xorx2;
  Term bv_15 = s->make_pbv_symbol("15", bv4);
  Term else_branch = bv_15;
  Term ite = s->make_term(Ite, condition, then_branch, else_branch);
  Term formula = s->make_term(Distinct, x1, ite);
}


INSTANTIATE_TEST_SUITE_P(
    ParameterizedArrayModelTests,
    BVModelTests,
    testing::ValuesIn(filter_solver_configurations({ ARRAY_MODELS })));

}  // namespace smt_tests




