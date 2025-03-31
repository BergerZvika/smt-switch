(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (not (= (int_to_pbv k 0) t)) (bvult (bvlshr s s) t))))
(check-sat)
(exit)