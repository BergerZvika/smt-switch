(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvneg (bvudiv (bvmul s s) s))) (distinct s s)))
(check-sat)
(exit)