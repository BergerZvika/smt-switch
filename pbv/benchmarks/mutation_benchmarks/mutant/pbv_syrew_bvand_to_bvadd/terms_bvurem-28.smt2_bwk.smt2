(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem (bvadd s (_ bv1 k)) s) (bvand s (bvurem (_ bv1 k) s))))
(check-sat)