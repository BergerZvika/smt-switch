(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvsub s s) (bvshl s s)) (bvshl s (bvadd (_ bv1 k) (bvshl s s)))))
(check-sat)
(exit)