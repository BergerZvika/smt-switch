(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvadd (bvadd t t) t)) (bvlshr s (bvadd t (bvadd t t)))))
(check-sat)
(exit)