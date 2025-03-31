(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvor (bvmul t t) t) t) (bvadd (bvlshr s s) (bvshl t t)))))
(check-sat)
(exit)