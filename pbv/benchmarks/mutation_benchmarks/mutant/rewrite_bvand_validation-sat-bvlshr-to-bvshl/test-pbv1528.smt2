(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s (_ bv1 k)) (bvshl t t)) (bvand (bvlshr s t) (bvadd t t))))
(check-sat)
(exit)