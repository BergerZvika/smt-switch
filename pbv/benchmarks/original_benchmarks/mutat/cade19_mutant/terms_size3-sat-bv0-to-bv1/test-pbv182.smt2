(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl t (int_to_pbv k 1)) t) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)