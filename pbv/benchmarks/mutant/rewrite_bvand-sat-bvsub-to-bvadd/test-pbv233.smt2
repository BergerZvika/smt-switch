(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvadd s (bvadd t (_ bv1 k)))) (bvsub (_ bv0 k) (bvor (_ bv1 k) (bvsub t s)))))
(check-sat)
(exit)