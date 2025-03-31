(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvnot s) (bvadd s s)) (bvand (bvneg s) (bvadd s s))))
(check-sat)
(exit)