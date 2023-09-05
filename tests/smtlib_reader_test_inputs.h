/*********************                                                        */
/*! \file smtlib_reader_test_inputs.h
** \verbatim
** Top contributors (to current version):
**   Makai Mann
** This file is part of the smt-switch project.
** Copyright (c) 2020 by the authors listed in the file AUTHORS
** in the top-level source directory) and their institutional affiliations.
** All rights reserved.  See the file LICENSE in the top-level source
** directory for licensing information.\endverbatim
**
** \brief List test inputs for SmtLibReader
**
**
**/

#pragma once

#include <unordered_map>
#include <vector>

#include "smt.h"

// maps tests to their expected results
const std::unordered_map<std::string, std::vector<smt::Result>> qf_uflia_tests({
    { "test-uf.smt2",
      { smt::Result(smt::SAT),
        smt::Result(smt::UNSAT),
        smt::Result(smt::SAT) } },
    { "test-symbols.smt2",
      { smt::Result(smt::SAT),
        smt::Result(smt::UNSAT),
        smt::Result(smt::SAT) } },
});

const std::unordered_map<std::string, std::vector<smt::Result>> qf_ufbv_tests(
    { { "test-attr.smt2",
        { smt::Result(smt::SAT), smt::Result(smt::UNSAT) } },
      { "test-define-sort.smt2", { smt::Result(smt::UNSAT) } },
      { "test-define-sort-edge-case.smt2", { smt::Result(smt::UNSAT) } } });

const std::unordered_map<std::string, std::vector<smt::Result>> qf_alia_tests({
    { "test-array.smt2", { smt::Result(smt::UNSAT) } },
    { "test-bv-k.smt2", { smt::Result(smt::SAT) }},
});

const std::unordered_map<std::string, std::vector<smt::Result>> qf_uf_tests(
    { { "test-uninterp-sort-zero-arity.smt2", { smt::Result(smt::SAT) } } });

const std::unordered_map<std::string, std::vector<smt::Result>>
    qf_uf_param_sorts_tests({ { "test-uninterp-sort-nonzero-arity.smt2",
                                { smt::Result(smt::UNSAT) } } });

const std::unordered_map<std::string, std::vector<smt::Result>> qf_pbv_tests(
    { 
      { "test-equal-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-equal-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-distinct-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-distinct-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-constant-width-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-constant-width-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-bvconstant-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-bvconstant-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-parametricconst-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvconstant-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvconstant-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvuge-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvuge-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvugt-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvugt-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvule-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvule-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvult-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvult-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvslt-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvslt-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvsle-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvsle-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvsgt-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvsgt-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvsge-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvsge-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvadd-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvadd-unsat.smt2",
          { smt::Result(smt::UNSAT)}},
      { "test-pbvsub-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvsub-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvmul-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvmul-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvudiv-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvudiv-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvurem-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvurem-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvnot-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvnot-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvneg-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvneg-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvshl-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvshl-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-pbvlshr-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvlshr-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
       { "test-pbvashr-sat.smt2",
        { smt::Result(smt::SAT)}},
      { "test-pbvashr-unsat.smt2",
        { smt::Result(smt::UNSAT)}},

      { "test-pbvconcat-sat.smt2",
          { smt::Result(smt::SAT)}},
      { "test-pbvconcat-unsat.smt2",
        { smt::Result(smt::UNSAT)}},

      // { "test-pbvand-sat.smt2",
      //   { smt::Result(smt::SAT)}},
      { "test-pbvand-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      
      // { "test-pbvor-sat.smt2",
      //   { smt::Result(smt::SAT)}},
      { "test-pbvor-unsat.smt2",
        { smt::Result(smt::UNSAT)}},

      { "test-postwalk-unsat.smt2",
        { smt::Result(smt::UNSAT)}},
      { "test-postwalk-sat.smt2",
        { smt::Result(smt::SAT)}},

      { "test-boolean-unsat.smt2",
        { smt::Result(smt::UNSAT)}},


      // { "test-pbvxor-sat.smt2",
      //   { smt::Result(smt::SAT)}},
      { "test-pbvxor-unsat.smt2",
        { smt::Result(smt::UNSAT)}}

    });