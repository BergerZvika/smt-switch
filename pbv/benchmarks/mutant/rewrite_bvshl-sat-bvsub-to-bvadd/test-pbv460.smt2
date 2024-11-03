(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule t (bvadd (_ bv0 k) (bvadd s (_ bv1 k)))) (bvule s (bvadd s t))))
(check-sat)
(exit)