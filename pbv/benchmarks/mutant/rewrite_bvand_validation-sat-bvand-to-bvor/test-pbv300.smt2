(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvor (_ bv1 k) (bvshl t s)))) (_ bv0 k)))
(check-sat)
(exit)