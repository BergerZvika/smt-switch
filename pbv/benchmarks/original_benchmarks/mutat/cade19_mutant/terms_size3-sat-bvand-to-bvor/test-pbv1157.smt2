(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvadd (bvor t (int_to_pbv k 0)) s)) (bvor s t)))
(check-sat)
(exit)