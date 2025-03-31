(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvor s t)) t) (bvshl (bvshl s t) (bvor s t))))
(check-sat)
(exit)