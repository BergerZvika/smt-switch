(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvlshr (bvnot (_ bv0 k)) t)) (bvshl s (bvlshr (bvnot t) t)))))
(check-sat)
(exit)