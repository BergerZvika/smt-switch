(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bvk k) (bvurem (_ bv0 k) t)) (= s s)))
(check-sat)
