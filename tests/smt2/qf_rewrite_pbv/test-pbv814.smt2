(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvnot (bvsub t (bvsub s t)))) (bvult s (bvsub t (bvnot t)))))
(check-sat)
(exit)