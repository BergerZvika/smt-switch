(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvudiv s s)) (_ bv1 k)))
(check-sat)
