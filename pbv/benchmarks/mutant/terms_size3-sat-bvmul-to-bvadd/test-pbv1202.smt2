(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvadd s s) (bvshl s s)) (bvshl s (bvor s (bvadd s s)))))
(check-sat)
(exit)