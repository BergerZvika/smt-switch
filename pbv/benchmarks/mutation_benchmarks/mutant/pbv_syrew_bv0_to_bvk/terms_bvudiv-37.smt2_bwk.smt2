(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv (bvlshr (_ bv1 k) s) s) (bvudiv (_ bvk k) s)))
(check-sat)
