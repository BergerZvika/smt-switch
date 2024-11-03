(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvand (bvshl t s) t)) (bvmul s (bvand t (bvshl t s))))))
(check-sat)
(exit)