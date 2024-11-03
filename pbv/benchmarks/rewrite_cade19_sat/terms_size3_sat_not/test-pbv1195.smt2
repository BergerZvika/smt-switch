(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvnot t) (bvor s t)) (bvlshr (bvnot s) (bvor s t)))))
(check-sat)
(exit)