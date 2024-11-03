(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (_ bv1 k) (bvor t s)) (bvsle (_ bv0 k) (bvor s t))))
(check-sat)
(exit)