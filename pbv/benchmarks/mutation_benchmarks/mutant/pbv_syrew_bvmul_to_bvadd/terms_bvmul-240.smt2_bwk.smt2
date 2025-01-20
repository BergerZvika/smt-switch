(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvadd s s) (bvlshr (_ bv1 k) s)) (bvmul s s)))
(check-sat)
