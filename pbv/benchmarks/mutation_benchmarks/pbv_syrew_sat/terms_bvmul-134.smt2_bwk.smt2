(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvlshr (bvand t (_ bv1 k)) t)) (_ bv0 k))))
(check-sat)
