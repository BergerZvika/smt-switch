(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvudiv s (bvneg t)) t) (bvult (bvudiv s t) (bvneg t))))
(check-sat)
(exit)