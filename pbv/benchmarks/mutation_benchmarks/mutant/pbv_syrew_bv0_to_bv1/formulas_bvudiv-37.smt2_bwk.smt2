(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule (bvudiv s s) (_ bv1 k)) (distinct s (_ bv1 k))))
(check-sat)
