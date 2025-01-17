(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (bvsub s t) (bvudiv s t)) (= t (bvsub s (bvudiv s t)))))
(check-sat)
(exit)