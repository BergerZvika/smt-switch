(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvshl t (int_to_pbv k 0))) (bvor s t))))
(check-sat)
(exit)