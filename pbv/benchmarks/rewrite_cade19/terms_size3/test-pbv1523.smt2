(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (bvnot (_ bv0 k)) s) t) (bvshl (bvlshr t s) s)))
(check-sat)
(exit)