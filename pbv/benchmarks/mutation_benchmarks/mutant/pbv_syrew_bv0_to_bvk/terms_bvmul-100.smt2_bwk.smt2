(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvnot (_ bvk k)) t)) (bvmul s (bvlshr (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
