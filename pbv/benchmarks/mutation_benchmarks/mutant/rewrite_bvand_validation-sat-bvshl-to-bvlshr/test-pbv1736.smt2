(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvnot s) (bvlshr (bvshl t s) t)) (bvshl (bvshl t s) t)))
(check-sat)
(exit)