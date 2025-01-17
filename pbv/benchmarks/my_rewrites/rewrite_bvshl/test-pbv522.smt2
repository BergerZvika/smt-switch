(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvadd s (bvshl t t))) (= s (bvsub (_ bv0 k) (bvshl t t)))))
(check-sat)
(exit)