(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s (bvshl t t)) t) (bvshl (bvand s (bvadd t t)) t)))
(check-sat)
(exit)