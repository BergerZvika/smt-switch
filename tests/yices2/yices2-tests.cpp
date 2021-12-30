/*********************                                                        */
/*! \file yices2-tests.cpp
** \verbatim
** Top contributors (to current version):
**   Amalee Wilson
** This file is part of the smt-switch project.
** Copyright (c) 2020 by the authors listed in the file AUTHORS
** in the top-level source directory) and their institutional affiliations.
** All rights reserved.  See the file LICENSE in the top-level source
** directory for licensing information.\endverbatim
**
** \brief
**
**
**/

#include <iostream>
#include <memory>
#include <vector>

#include "assert.h"
#include "smt.h"
#include "yices2_factory.h"
// after a full installation
// #include "smt-switch/boolector_factory.h"
// #include "smt-switch/smt.h"

using namespace smt;
using namespace std;

int main()
{
  SmtSolver s = Yices2SolverFactory::create(true);
  s->set_logic("QF_ABV");
  s->set_opt("produce-models", "true");
  Sort bvsort8 = s->make_sort(BV, 8);
  Term x = s->make_symbol("x", bvsort8);
  Term y = s->make_symbol("y", bvsort8);
  Term z = s->make_symbol("z", bvsort8);
  Term _true = s->make_term(true);
  assert(x != y);
  Term x_copy = x;
  assert(x == x_copy);

  // check sorts
  Sort xsort = x->get_sort();
  Sort ysort = y->get_sort();
  assert(xsort == ysort);

  Sort arr_sort = s->make_sort(ARRAY, s->make_sort(BV, 4), bvsort8);
  assert(xsort != arr_sort);
  assert(xsort != arr_sort->get_indexsort());
  assert(xsort == arr_sort->get_elemsort());

  Term xpy = s->make_term(BVAdd, x, y);
  Term z_eq_xpy = s->make_term(Equal, z, xpy);

  assert(x->is_symbolic_const());
  assert(!xpy->is_symbolic_const());

  Op ext30 = Op(Extract, 3, 0);
  Term x_lower = s->make_term(ext30, x);
  Term x_ext = s->make_term(Op(Zero_Extend, 4), x_lower);

  Sort funsort =
      s->make_sort(FUNCTION, SortVec{ x_lower->get_sort(), x->get_sort() });
  Term uf = s->make_symbol("f", funsort);
  Term uf_app = s->make_term(Apply, uf, x_lower);
  assert(uf_app->get_op() == Apply);
  assert(uf->get_sort() == funsort);
  assert(uf->get_sort() != uf_app->get_sort());

  s->assert_formula(z_eq_xpy);
  s->assert_formula(s->make_term(BVUlt, x, s->make_term(4, bvsort8)));
  s->assert_formula(s->make_term(BVUlt, y, s->make_term(4, bvsort8)));
  s->assert_formula(s->make_term(BVUgt, z, s->make_term("5", bvsort8)));
  // This is actually a redundant assertion -- just testing
  s->assert_formula(s->make_term(Equal, x_ext, x));
  s->assert_formula(s->make_term(Distinct, x, z));
  s->assert_formula(s->make_term(BVUle, uf_app, s->make_term(3, bvsort8)));
  s->assert_formula(
      s->make_term(BVUge, uf_app, s->make_term("00000011", bvsort8, 2)));

  Result r = s->check_sat();
  assert(r.is_sat());

  Term xc = s->get_value(x);
  Term yc = s->get_value(y);
  Term zc = s->get_value(z);
  Term x_extc = s->get_value(x_ext);
  Term x_lowerc = s->get_value(x_lower);
  Term uf_appc = s->get_value(uf_app);

  cout << "Got the following values:" << endl;
  cout << "\t" << x << " " << xc << endl;
  cout << "\t" << y << " " << yc->to_int() << endl;
  cout << "\t" << z << " " << zc->to_int() << endl;
  cout << "\t" << x_lower << " " << x_lowerc->to_int() << endl;
  cout << "\t" << x_ext << " " << x_extc->to_int() << endl;
  cout << "\t" << uf_app << " " << uf_appc->to_int() << endl;
  return 0;
}
