(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvneg (bvnot (bvsub s t)))) (distinct s (bvnot (bvneg (bvadd s t))))))
(check-sat)
(exit)