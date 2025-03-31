(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle (int_to_pbv k 0) (bvadd s s)) (bvsle s (bvadd s s)))))
(check-sat)
(exit)