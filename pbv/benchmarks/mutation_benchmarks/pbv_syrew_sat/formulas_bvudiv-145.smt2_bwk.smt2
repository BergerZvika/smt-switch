(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand s (bvudiv (_ bv1 k) s))) (bvult (_ bv1 k) s))))
(check-sat)