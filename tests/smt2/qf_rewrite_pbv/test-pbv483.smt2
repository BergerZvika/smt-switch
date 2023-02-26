(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (bvsub s t) (bvudiv t s)) (= t (bvsub s (bvudiv t s)))))
(check-sat)
(exit)