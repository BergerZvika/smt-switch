(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (bvnot t) (bvmul s s)) (= t (bvnot (bvmul s s)))))
(check-sat)
(exit)