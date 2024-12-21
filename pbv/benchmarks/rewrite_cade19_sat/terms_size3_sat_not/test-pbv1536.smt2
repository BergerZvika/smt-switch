(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand (bvshl s s) t) s) (bvshl (bvand (bvadd s s) t) s))))
(check-sat)
(exit)