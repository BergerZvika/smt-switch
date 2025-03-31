(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvor t (bvneg (int_to_pbv k 0)))) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)