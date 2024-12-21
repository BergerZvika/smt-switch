(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvshl (bvadd s (_ bv1 k)) t)) (= (_ bv1 k) (bvshl s t))))
(check-sat)
(exit)