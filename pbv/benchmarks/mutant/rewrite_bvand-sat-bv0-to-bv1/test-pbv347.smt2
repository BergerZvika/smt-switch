(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvsub s (_ bv1 k)) (bvsub (_ bv1 k) s)) (bvsub (_ bv0 k) (_ bv1 k))))
(check-sat)
(exit)