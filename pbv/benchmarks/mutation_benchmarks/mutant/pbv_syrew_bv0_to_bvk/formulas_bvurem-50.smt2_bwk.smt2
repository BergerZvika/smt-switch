(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule (bvurem (_ bvk k) t) (_ bv1 k)) (= s s)))
(check-sat)
