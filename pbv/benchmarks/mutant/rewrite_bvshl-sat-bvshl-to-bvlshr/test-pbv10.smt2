(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvadd s (bvadd t t))) (bvlshr (bvadd s t) (_ bv1 k))))
(check-sat)
(exit)