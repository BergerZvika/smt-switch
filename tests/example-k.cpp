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
    // this->smtsolver = create_solver(GetParam());
    SolverConfiguration cvc5_solver = SolverConfiguration(CVC5, true);
    this->smtsolver = create_solver(cvc5_solver);
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

// bvadd
TEST_P(BVModelTests, TestPBVAddSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvadd = s->make_term(BVAdd, x1, x2);
  Term equal = s->make_term(Equal, bvadd, x3);
  s->assert_formula(equal);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestPBVAddunSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvadd = s->make_term(BVAdd, x1, x2);
  Term equal = s->make_term(Equal, bvadd, x3);
  Term one = s->make_term(1, intsort);
  Term width = s->make_term(Equal, k, one);
  Term x1_equal_x2 = s->make_term(Equal, x1, x2);
  Term x3_distinct = s->make_term(Distinct, x3, x1, bvadd); 
  Term width_and_equal = s->make_term(And, width, equal);
  Term width_and_equal_and_x1x2 = s->make_term(And, width_and_equal, x1_equal_x2);
  Term and_all = s->make_term(And, width_and_equal_and_x1x2, x3_distinct);
  s->assert_formula(and_all);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_unsat());
}

// TEST_P(BVModelTests, TestPBVAddunSat2)
// {
//   PBVSolver* s = new PBVSolver(smtsolver);
//   s->set_opt("produce-models", "true");
//   Sort intsort = s->make_sort(INT);
//   Term k = s->make_symbol("k", intsort);
//   Term m = s->make_symbol("m", intsort);
//   Sort bvk = s->make_sort(BV, k);
//   Sort bvm = s->make_sort(BV, m);
//   Term x1 = s->make_pbv_symbol("x1", bvk);
//   Term x2 = s->make_pbv_symbol("x2", bvk);
//   Term x3 = s->make_pbv_symbol("x3", bvm);
//   Term bvadd = s->make_term(BVAdd, x1, x2);
//   Term equal = s->make_term(Equal, bvadd, x3);
//   Term one = s->make_term(1, intsort);
//   Term width = s->make_term(Equal, k, one);
//   Term x1_equal_x2 = s->make_term(Equal, x1, x2);
//   Term x3_minus_x3 = s->make_term(Minus, );
//   Term x3_distinct = s->make_term(Distinct, x3, zero); 
//   Term width_and_equal = s->make_term(And, width, equal);
//   Term width_and_equal_and_x1x2 = s->make_term(And, width_and_equal, x1_equal_x2);
//   Term and_all = s->make_term(And, width_and_equal_and_x1x2, x3_distinct);
//   s->assert_formula(and_all);
//   Result r = s->check_sat();
//   ASSERT_TRUE(r.is_unsat());
// }

// bvsub
TEST_P(BVModelTests, TestPBVSubSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvsub = s->make_term(BVSub, x1, x2);
  Term equal = s->make_term(Equal, bvsub, x3);
  s->assert_formula(equal);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestPBVSubunSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvsub = s->make_term(BVSub, x1, x2);
  Term equal = s->make_term(Equal, bvsub, x3);
  Term one = s->make_term(1, intsort);
  Term width = s->make_term(Equal, k, one);
  Term x1_equal_x2 = s->make_term(Equal, x1, x2);
  Term x3_distinct = s->make_term(Distinct, x3, x1, bvsub); 
  Term width_and_equal = s->make_term(And, width, equal);
  Term width_and_equal_and_x1x2 = s->make_term(And, width_and_equal, x1_equal_x2);
  Term and_all = s->make_term(And, width_and_equal_and_x1x2, x3_distinct);
  s->assert_formula(and_all);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_unsat());
}

// bvmul
TEST_P(BVModelTests, TestPBVMulSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvmul = s->make_term(BVMul, x1, x2);
  Term equal = s->make_term(Equal, bvmul, x3);
  s->assert_formula(equal);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_sat());
}

TEST_P(BVModelTests, TestPBMulbunSat)
{
  PBVSolver* s = new PBVSolver(smtsolver);
  s->set_opt("produce-models", "true");
  Sort intsort = s->make_sort(INT);
  Term k = s->make_symbol("k", intsort);
  Term m = s->make_symbol("m", intsort);
  Sort bvk = s->make_sort(BV, k);
  Sort bvm = s->make_sort(BV, m);
  Term x1 = s->make_pbv_symbol("x1", bvk);
  Term x2 = s->make_pbv_symbol("x2", bvk);
  Term x3 = s->make_pbv_symbol("x3", bvm);
  Term bvmul = s->make_term(BVMul, x1, x2);
  Term equal = s->make_term(Equal, bvmul, x3);
  Term one = s->make_term(1, intsort);
  Term width = s->make_term(Equal, k, one);
  Term x1_equal_x2 = s->make_term(Equal, x1, x2);
  Term x3_distinct = s->make_term(Distinct, x3, bvmul);
  Term x3_equal = s->make_term(Equal, x3, x1); 
  Term x3_distinct_and_equal = s->make_term(And, x3_distinct, x3_equal); 
  Term width_and_equal = s->make_term(And, width, equal);
  Term width_and_equal_and_x1x2 = s->make_term(And, width_and_equal, x1_equal_x2);
  Term and_all = s->make_term(And, width_and_equal_and_x1x2, x3_distinct_and_equal);
  s->assert_formula(and_all);
  Result r = s->check_sat();
  ASSERT_TRUE(r.is_unsat());
}

// bvudiv
// TEST_P(BVModelTests, TestPBVDivSat)
// {
//   PBVSolver* s = new PBVSolver(smtsolver);
//   s->set_opt("produce-models", "true");
//   Sort intsort = s->make_sort(INT);
//   Term k = s->make_symbol("k", intsort);
//   Term m = s->make_symbol("m", intsort);
//   Sort bvk = s->make_sort(BV, k);
//   Sort bvm = s->make_sort(BV, m);
//   Term x1 = s->make_pbv_symbol("x1", bvk);
//   Term x2 = s->make_pbv_symbol("x2", bvk);
//   Term x3 = s->make_pbv_symbol("x3", bvm);
//   Term bvdiv = s->make_term(BVUdiv, x1, x2);
//   Term equal = s->make_term(Equal, bvdiv, x3);
//   s->assert_formula(equal);
//   Result r = s->check_sat();
//   ASSERT_TRUE(r.is_sat());
// }


INSTANTIATE_TEST_SUITE_P(
    ParameterizedArrayModelTests,
    BVModelTests,
    testing::ValuesIn(filter_solver_configurations({ ARRAY_MODELS })));

}  // namespace smt_tests



