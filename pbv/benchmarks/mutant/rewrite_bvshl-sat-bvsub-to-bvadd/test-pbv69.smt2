(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (_ bv1 k) (bvshl (bvadd t s) s)) (bvsub (_ bv1 k) (bvshl (bvsub s t) s))))
(check-sat)
(exit)