(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvsub (bvmul t t) t)) (bvand s (bvadd t (bvmul t t)))))
(check-sat)
(exit)