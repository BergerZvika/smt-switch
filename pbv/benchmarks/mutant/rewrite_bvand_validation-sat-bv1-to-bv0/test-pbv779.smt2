(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand t (bvshl (bvshl (_ bv0 k) s) s))) (bvshl s (bvand t (bvshl (bvshl s s) s)))))
(check-sat)
(exit)