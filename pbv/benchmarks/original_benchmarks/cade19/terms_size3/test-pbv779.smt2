(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvadd (bvmul t t) t)) (bvlshr s (bvadd t (bvmul t t)))))
(check-sat)
(exit)