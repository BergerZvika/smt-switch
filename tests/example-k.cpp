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
    SmtSolver solver = create_solver(GetParam());
    s = new PBVSolver(solver);
    Sort intsort = s->make_sort(INT);
    Term k = s->make_symbol("k" ,intsort);
    s->set_opt("produce-models", "true");
    bvsort = s->make_sort(BV, k);
    bvterm_x = s->make_pbv_symbol("bv_k", bvsort);
    bvterm_y = s->make_pbv_symbol("pbv_k", bvsort);
  }
  PBVSolver* s;
  Sort bvsort;
  Term bvterm_x, bvterm_y, k;
};


TEST_P(BVModelTests, TestPBVTermModel)
{
  Term constraint1 = s->make_term(Equal, bvterm_x, bvterm_x);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestEQModel)
{
  Sort intsort = s->make_sort(INT);
  Term t = s->make_term(4 ,intsort);
  Term t2 = s->make_term(4 ,intsort);
  ASSERT_EQ(t, t2);

  Term constraint1 = s->make_term(Equal, bvterm_x, bvterm_y);
  Term constraint2 = s->make_term(Equal, bvterm_x, bvterm_y);
  ASSERT_EQ(constraint1, constraint2);
}

TEST_P(BVModelTests, TestTrivialPBV)
{
  Sort intsort = s->make_sort(INT);
  Term four = s->make_term("4", intsort);
  Sort bv4 = s->make_sort(BV, four);
  Term x1 = s->make_pbv_symbol("x1", bv4);
  Term x2 = s->make_pbv_symbol("x2", bv4);
  Term formula = s->make_term(Equal, x1, x2);
  s->assert_formula(formula);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestTranslatePBV)
{
  Sort intsort = s->make_sort(INT);
  Term four = s->make_term("4", intsort);
  Sort bv4 = s->make_sort(BV, four);
  Term x1 = s->make_pbv_symbol("x1", bv4);
  Term x2 = s->make_pbv_symbol("x2", bv4);
  Term formula = s->make_term(Equal, x1, x2);
  Term res = s->translate_term(formula);
  Sort bv_4 = s->make_sort(BV, 4);
  TermVec children;
  children.insert(children.begin(), res->begin(), res->end());
  Term t1 = children[0];
  Sort s1 = t1->get_sort();
  ASSERT_TRUE(s1 == bv_4);
  ASSERT_TRUE(children[0]->get_sort() == bv_4);
  ASSERT_TRUE(children[1]->get_sort() == bv_4);
}

TEST_P(BVModelTests, TestIntsortPBV)
{
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

TEST_P(BVModelTests, TestTranslatePBV_K)
{
  Sort intsort = s->make_sort(INT);
  Term four = s->make_term("4", intsort);
  Sort bv4 = s->make_sort(BV, four);
  Term seven = s->make_term("7", intsort);
  Sort bv7 = s->make_sort(BV, seven);
  Term x1 = s->make_pbv_symbol("x1", bv4);
  Term x2 = s->make_pbv_symbol("x2", bv7);
  Term formula = s->make_term(Distinct, x1, x2);
  Term res = s->translate_term(formula);
  TermVec children;
  children.insert(children.begin(), res->begin(), res->end());
  Term t1 = children[0];
  Sort s1 = t1->get_sort();
  ASSERT_TRUE(children[0]->get_sort() != children[1]->get_sort());
}


INSTANTIATE_TEST_SUITE_P(
    ParameterizedArrayModelTests,
    BVModelTests,
    testing::ValuesIn(filter_solver_configurations({ ARRAY_MODELS })));

}  // namespace smt_tests




