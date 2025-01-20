(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvlshr (bvmul s s) (_ bv1 k))) (distinct s (bvadd s (bvshl (_ bv1 k) (_ bv1 k))))))
(check-sat)
