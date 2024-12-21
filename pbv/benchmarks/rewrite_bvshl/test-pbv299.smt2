(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvsub t (bvadd t t))) (bvult s (bvadd s t))))
(check-sat)
(exit)