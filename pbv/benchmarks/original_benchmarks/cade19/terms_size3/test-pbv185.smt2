(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvand s (bvneg s))) (bvor s (bvneg s))))
(check-sat)
(exit)