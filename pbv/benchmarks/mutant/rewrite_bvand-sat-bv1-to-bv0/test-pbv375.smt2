(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvor (_ bv0 k) (bvadd s s)) t) (bvadd s (bvsub s (bvsub t (_ bv1 k))))))
(check-sat)
(exit)