(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvlshr s s) s) (= (int_to_pbv k 0) (bvshl s s))))
(check-sat)
(exit)