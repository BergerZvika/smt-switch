(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv0 k) (bvsub (_ bv1 k) (bvor s (_ bv1 k)))) (bvor (_ bv1 k) (bvsub (_ bv1 k) s))))
(check-sat)
(exit)