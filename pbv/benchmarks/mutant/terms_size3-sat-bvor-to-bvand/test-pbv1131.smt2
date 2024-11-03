(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvadd (bvmul t (_ bv0 k)) s)) (bvor s t)))
(check-sat)
(exit)