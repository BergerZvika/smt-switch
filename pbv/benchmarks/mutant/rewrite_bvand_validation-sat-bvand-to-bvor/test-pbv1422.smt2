(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvshl t (bvadd s t))) (bvand (_ bv1 k) (bvshl s (bvadd s t)))))
(check-sat)
(exit)