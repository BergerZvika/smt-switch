(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv (_ bvk k) (bvshl s t)) (bvudiv t (bvshl s t))))
(check-sat)
