(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvadd t (_ bv1 k)) t) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)