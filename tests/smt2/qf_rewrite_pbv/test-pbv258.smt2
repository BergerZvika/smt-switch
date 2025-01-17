(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvmul s (bvsub s t))) (= t (bvmul s (bvadd s t)))))
(check-sat)
(exit)