(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvneg (bvnot (bvsub s s)))) (= s (bvudiv s s))))
(check-sat)
(exit)