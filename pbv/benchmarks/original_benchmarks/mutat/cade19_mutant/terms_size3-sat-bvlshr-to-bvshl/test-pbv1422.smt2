(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvadd s (bvmul s s)) s) (bvlshr (bvadd s (bvadd s s)) s)))
(check-sat)
(exit)