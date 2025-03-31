(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul t t) (bvneg (int_to_pbv k 1))) (bvadd (bvlshr s s) (bvmul t t))))
(check-sat)
(exit)