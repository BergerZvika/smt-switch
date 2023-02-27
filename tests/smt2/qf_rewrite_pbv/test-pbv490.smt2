(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvsub s t) (bvudiv t t)) (= t (bvudiv s (bvudiv t t)))))
(check-sat)
(exit)