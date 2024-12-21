(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (distinct t (bvadd s (bvadd t t))) (distinct t (bvsub (_ bv0 k) s)))))
(check-sat)
(exit)