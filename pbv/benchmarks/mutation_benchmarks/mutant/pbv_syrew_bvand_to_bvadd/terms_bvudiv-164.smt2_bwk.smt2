(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl t (bvudiv (_ bv0 k) s))) (bvand s t)))
(check-sat)
