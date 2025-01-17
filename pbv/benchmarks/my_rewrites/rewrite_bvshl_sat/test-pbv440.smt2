(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= t (bvsub s (bvshl (_ bv1 k) s))) (= s (bvadd t (bvshl (_ bv1 k) s))))))
(check-sat)
(exit)