(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvnot (bvurem (_ bv1 k) t))) (_ bv0 k)))
(check-sat)
