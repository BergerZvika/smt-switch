(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv1 k) (bvurem (_ bvk k) t)) (= s s)))
(check-sat)
