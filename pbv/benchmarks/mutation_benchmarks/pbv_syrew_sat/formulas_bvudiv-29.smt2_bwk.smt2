(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= (_ bv1 k) (bvudiv (_ bv0 k) s)) (distinct s s))))
(check-sat)
