(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvlshr (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvlshr (bvurem s t) t))))
(check-sat)
