(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl s s) (bvshl t s)) (bvshl (bvand s t) s))))
(check-sat)
(exit)