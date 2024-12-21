(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvsub s (bvshl (_ bv0 k) t))) (= (_ bv0 k) (bvshl (_ bv1 k) t))))
(check-sat)
(exit)