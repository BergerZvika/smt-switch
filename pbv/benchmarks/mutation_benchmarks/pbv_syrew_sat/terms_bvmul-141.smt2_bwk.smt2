(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvlshr (bvshl (_ bv1 k) s) (_ bv1 k))) (bvmul s (bvlshr (bvshl s (_ bv1 k)) s)))))
(check-sat)
