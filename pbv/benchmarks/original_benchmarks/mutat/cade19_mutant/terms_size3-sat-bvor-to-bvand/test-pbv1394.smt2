(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvneg s)) s) (bvneg (bvshl s s))))
(check-sat)
(exit)