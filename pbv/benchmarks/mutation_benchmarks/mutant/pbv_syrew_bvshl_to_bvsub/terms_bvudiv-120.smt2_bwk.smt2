(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvsub t (bvudiv s s))) (bvand s (bvshl t (_ bv1 k)))))
(check-sat)
