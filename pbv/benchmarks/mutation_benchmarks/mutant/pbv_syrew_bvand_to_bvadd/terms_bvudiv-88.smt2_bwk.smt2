(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvudiv s (bvand t (_ bv1 k)))) s))
(check-sat)
