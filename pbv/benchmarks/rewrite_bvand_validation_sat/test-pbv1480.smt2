(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvadd s s) (bvand s (_ bv1 k))) (bvshl s (bvadd (_ bv1 k) (bvand s (_ bv1 k)))))))
(check-sat)
(exit)