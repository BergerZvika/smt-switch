(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (bvnot (_ bv1 k)) s)) (bvurem s (bvlshr (bvnot s) s))))
(check-sat)
