(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvmul t (bvshl (_ bv1 k) s))) (_ bv0 k))))
(check-sat)
