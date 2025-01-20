(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvand (_ bv0 k) (bvurem (_ bv1 k) t))) (bvlshr s (bvurem (_ bv1 k) t))))
(check-sat)
