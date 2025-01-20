(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv s (bvand t (_ bv1 k)))) (_ bvk k)))
(check-sat)
