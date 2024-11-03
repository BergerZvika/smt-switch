(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl t (bvnot (bvand t (_ bv0 k))))) (_ bv0 k)))
(check-sat)
(exit)