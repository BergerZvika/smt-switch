(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvadd s (bvnot (bvadd s t)))) (distinct t (bvnot s))))
(check-sat)
(exit)