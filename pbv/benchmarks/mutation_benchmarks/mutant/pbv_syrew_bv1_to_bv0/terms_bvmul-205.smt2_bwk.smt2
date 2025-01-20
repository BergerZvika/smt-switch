(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (_ bv0 k) (bvshl (bvlshr s (_ bv1 k)) s)) (bvlshr (_ bv1 k) (bvlshr (bvmul s s) s))))
(check-sat)
