(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvshl s (bvudiv (_ bv1 k) s))) (= s s))))
(check-sat)
