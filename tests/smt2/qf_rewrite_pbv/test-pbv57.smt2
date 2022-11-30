(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvnot (bvsub t s))) (bvult s (bvneg (bvnot t)))))
(check-sat)
(exit)