(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (distinct t (bvshl (bvshl s t) (_ bv1 k))) (distinct t (bvshl (bvadd s s) t)))))
(check-sat)
(exit)