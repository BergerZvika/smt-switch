(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvadd s (bvlshr s t))) (bvadd s (bvadd t (bvlshr s t))))))
(check-sat)
(exit)