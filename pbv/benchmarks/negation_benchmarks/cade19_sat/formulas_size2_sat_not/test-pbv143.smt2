(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult s (bvshl t (int_to_pbv k 0))) (bvult s t))))
(check-sat)
(exit)