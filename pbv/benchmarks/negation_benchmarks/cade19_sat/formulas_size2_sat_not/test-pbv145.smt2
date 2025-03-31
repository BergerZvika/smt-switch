(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt s (bvshl t (int_to_pbv k 0))) (bvslt s t))))
(check-sat)
(exit)