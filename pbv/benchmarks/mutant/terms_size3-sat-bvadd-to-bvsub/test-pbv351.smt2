(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvadd t (bvnot (_ bv0 k)))) (bvnot (bvneg (bvadd s t)))))
(check-sat)
(exit)