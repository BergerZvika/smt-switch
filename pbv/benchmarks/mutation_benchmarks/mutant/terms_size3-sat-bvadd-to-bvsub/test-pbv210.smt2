(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvnot (bvneg t))) (bvnot (bvneg (bvadd s t)))))
(check-sat)
(exit)