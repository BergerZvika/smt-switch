(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr s (bvadd s (_ bv1 k)))) (bvurem s (bvlshr s (_ bv1 k)))))
(check-sat)
