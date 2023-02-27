(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvsub s (bvnot s))) (= s (bvnot (bvsub s t)))))
(check-sat)
(exit)