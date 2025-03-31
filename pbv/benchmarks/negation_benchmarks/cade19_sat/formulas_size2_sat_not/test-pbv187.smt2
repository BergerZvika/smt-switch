(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= t (bvneg s)) (= s (bvneg t)))))
(check-sat)
(exit)