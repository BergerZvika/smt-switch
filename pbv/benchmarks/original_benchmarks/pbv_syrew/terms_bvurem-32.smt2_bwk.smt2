(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvurem (_ bv1 k) s) s) (bvlshr (_ bv1 k) s)))
(check-sat)
