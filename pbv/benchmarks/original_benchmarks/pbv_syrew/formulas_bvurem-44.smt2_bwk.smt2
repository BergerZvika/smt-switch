(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule (bvurem s (_ bv0 k)) t) (bvule s t)))
(check-sat)
