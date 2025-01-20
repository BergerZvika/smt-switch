(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (bvshl s s) (_ bv1 k))) (bvshl s (bvor s (bvnot (_ bv1 k))))))
(check-sat)
