(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr (bvmul s s) (bvlshr (_ bv1 k) s)) (bvmul s s))))
(check-sat)
