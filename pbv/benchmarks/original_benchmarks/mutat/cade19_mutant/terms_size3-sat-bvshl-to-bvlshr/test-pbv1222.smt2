(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvlshr s s) (bvshl s s)) (bvshl (bvadd s s) s)))
(check-sat)
(exit)