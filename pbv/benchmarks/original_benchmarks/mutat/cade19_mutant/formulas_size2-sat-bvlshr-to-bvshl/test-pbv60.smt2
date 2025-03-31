(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvshl s t)) (= s (bvshl s t))))
(check-sat)
(exit)