(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvadd t (bvnot t))) (bvnot (bvneg s))))
(check-sat)
(exit)