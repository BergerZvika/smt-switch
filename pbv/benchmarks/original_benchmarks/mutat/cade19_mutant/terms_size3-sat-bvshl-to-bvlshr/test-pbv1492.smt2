(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvshl t t)) t) (bvmul s (bvshl (bvadd t t) t))))
(check-sat)
(exit)