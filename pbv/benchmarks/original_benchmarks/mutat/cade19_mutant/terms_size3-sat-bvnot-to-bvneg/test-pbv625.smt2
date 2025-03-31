(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvneg (int_to_pbv k 0)) s)) (bvlshr s (bvshl s s))))
(check-sat)
(exit)