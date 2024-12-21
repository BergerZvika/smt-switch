(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (_ bv0 k) (bvsub s (bvadd t t))) (distinct s (bvshl (bvadd s t) (_ bv1 k)))))
(check-sat)
(exit)