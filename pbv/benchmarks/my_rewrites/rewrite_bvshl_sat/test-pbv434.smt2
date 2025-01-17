(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult t (bvadd s (bvadd t (_ bv1 k)))) (bvult s (bvadd s (bvadd t (_ bv1 k)))))))
(check-sat)
(exit)