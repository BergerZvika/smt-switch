(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvurem t (bvurem (_ bv0 k) s))) (bvule s (bvurem t (bvlshr s (_ bv1 k))))))
(check-sat)
