(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvlshr (bvmul s s) s)) (bvlshr (bvmul s s) s)))
(check-sat)
