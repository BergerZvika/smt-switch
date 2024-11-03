(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvlshr t s))) (bvlshr s (bvneg (bvlshr t s)))))
(check-sat)
(exit)