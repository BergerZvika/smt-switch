(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvsub (bvnot s) s) t) (bvule (bvnot t) (bvadd s s))))
(check-sat)
(exit)