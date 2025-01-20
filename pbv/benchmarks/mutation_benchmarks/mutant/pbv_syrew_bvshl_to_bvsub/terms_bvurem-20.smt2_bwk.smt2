(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem (_ bv1 k) (bvlshr (_ bv1 k) s)) (bvurem (_ bv1 k) (bvsub (_ bv1 k) s))))
(check-sat)
