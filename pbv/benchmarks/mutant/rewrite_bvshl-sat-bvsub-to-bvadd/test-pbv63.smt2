(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (_ bv0 k) (bvshl (bvsub s t) s)) (bvshl (bvsub t s) s)))
(check-sat)
(exit)