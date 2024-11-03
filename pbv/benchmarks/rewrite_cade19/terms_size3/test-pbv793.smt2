(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand (bvmul t t) t)) (bvshl s (bvand t (bvmul t t)))))
(check-sat)
(exit)