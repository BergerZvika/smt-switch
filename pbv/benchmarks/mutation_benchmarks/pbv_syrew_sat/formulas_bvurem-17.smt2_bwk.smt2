(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvurem (_ bv0 k) t)) (= s (_ bv0 k)))))
(check-sat)
