(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvnot (bvsub t (bvnot t)))) (bvult s (bvnot (bvadd t t)))))
(check-sat)
(exit)