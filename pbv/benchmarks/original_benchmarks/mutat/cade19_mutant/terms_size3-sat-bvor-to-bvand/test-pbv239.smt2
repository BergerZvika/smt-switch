(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvnot (bvshl t s))) (bvnot (bvshl t s))))
(check-sat)
(exit)