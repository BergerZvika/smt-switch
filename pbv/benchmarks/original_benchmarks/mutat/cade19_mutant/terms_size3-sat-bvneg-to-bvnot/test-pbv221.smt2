(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvshl s s))) (bvlshr s (bvshl s s))))
(check-sat)
(exit)