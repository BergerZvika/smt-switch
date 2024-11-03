(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (_ bv1 k) (bvor s (bvsub s (_ bv1 k)))) (bvadd s (bvor s (bvsub (_ bv0 k) s)))))
(check-sat)
(exit)