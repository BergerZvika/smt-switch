(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvadd s (bvadd t t)) t) (bvult (bvnot (bvadd s t)) t)))
(check-sat)
(exit)