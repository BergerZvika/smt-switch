(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvadd s (bvsub s t))) (= (_ bv0 k) (bvsub s t))))
(check-sat)
(exit)