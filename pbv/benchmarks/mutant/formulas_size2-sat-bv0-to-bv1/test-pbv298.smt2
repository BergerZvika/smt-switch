(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvmul s (_ bv1 k)) s) (bvsle (_ bv0 k) s)))
(check-sat)
(exit)