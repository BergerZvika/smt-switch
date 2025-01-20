(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvadd s (bvor s t))) (bvand t (bvand (_ bv1 k) (bvadd s t)))))
(check-sat)
(exit)