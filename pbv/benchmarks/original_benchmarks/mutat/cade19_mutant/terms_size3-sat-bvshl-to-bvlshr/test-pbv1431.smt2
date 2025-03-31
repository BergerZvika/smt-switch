(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvadd s (bvshl s s)) s) (bvshl (bvadd s (bvadd s s)) s)))
(check-sat)
(exit)