(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvnot (bvurem s (_ bv0 k)))) (_ bv0 k))))
(check-sat)
