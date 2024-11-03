(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvshl (bvadd (_ bv0 k) s) s)) (distinct t (bvsub (_ bv0 k) (bvshl s s)))))
(check-sat)
(exit)