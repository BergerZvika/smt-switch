(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvadd (_ bv1 k) (bvor s (_ bv1 k)))) (bvor (_ bv1 k) (bvadd s (bvadd (_ bv1 k) (_ bv1 k))))))
(check-sat)
(exit)