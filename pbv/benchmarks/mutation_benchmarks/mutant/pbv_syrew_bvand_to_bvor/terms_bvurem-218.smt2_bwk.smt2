(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvor (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvurem s (bvlshr (_ bv1 k) t))))
(check-sat)
