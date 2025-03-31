(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvor (bvshl s s) t) s) (bvshl (bvor (bvadd s s) t) s)))
(check-sat)
(exit)