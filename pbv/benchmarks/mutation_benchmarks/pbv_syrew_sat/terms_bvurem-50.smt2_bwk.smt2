(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvurem s (bvnot (_ bv0 k)))) (bvlshr s (bvurem s (bvnot (_ bv0 k)))))))
(check-sat)
