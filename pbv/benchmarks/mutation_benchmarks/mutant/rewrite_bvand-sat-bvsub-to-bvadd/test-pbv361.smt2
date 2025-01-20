(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvor s (bvadd s s)) (_ bv1 k)) (bvor (bvadd s s) (bvsub s (_ bv1 k)))))
(check-sat)
(exit)