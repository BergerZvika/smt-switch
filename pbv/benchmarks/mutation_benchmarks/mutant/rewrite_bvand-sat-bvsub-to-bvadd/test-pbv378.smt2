(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvor (_ bv1 k) (bvadd s t)) s) (bvadd s (bvor (_ bv1 k) (bvsub t s)))))
(check-sat)
(exit)