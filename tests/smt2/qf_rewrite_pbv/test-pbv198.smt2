(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvudiv (bvudiv t t) t)) (bvule s (bvudiv (bvudiv s s) t))))
(check-sat)
(exit)