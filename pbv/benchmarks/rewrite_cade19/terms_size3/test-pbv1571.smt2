(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvshl s t) t) t) (bvlshr (bvshl s (bvadd t t)) t)))
(check-sat)
(exit)