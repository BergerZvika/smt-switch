(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (bvor (_ bv1 k) (bvadd s t)) t) (bvadd t (bvor (_ bv1 k) (bvsub s t))))))
(check-sat)
(exit)