(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvand s (bvudiv (_ bvk k) t))) (distinct s (bvshl s t))))
(check-sat)
