(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvand (bvneg t) t)) (bvmul s (bvand t (bvneg t))))))
(check-sat)
(exit)