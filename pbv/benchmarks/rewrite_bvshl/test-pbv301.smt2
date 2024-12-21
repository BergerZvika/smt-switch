(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvadd t (bvadd t (_ bv1 k)))) (bvule s (bvadd t t))))
(check-sat)
(exit)