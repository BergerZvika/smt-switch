(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (bvshl (bvsub (_ bv0 k) s) s) s) (bvsub (_ bv0 k) (bvadd s (bvshl s s))))))
(check-sat)
(exit)