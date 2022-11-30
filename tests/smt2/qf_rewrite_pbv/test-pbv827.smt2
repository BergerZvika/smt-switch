(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvneg (bvmul t (bvudiv t t)))) (distinct t (bvneg s))))
(check-sat)
(exit)