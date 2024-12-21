(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvadd (bvshl (_ bv1 k) s) s)) (= s (bvsub (bvshl (_ bv1 k) s) t))))
(check-sat)
(exit)