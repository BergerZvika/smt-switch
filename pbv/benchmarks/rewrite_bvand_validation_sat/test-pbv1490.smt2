(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl s s) (bvadd (_ bv1 k) (_ bv1 k))) (bvand (bvadd s s) (bvshl s s)))))
(check-sat)
(exit)