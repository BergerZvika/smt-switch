(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule s (bvor (_ bv0 k) t)) (bvule s t))))
(check-sat)
(exit)