(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvand s (bvadd s s))) (bvand s (bvand t (bvmul s s)))))
(check-sat)
(exit)