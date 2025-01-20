(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvlshr (_ bv1 k) (bvurem (_ bv1 k) t))) (bvlshr s (bvurem t (bvurem (_ bv1 k) t))))))
(check-sat)
