(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (_ bv1 k) (bvand s (bvadd s s))) (bvor (_ bv1 k) (bvand s (bvadd s s))))))
(check-sat)
(exit)