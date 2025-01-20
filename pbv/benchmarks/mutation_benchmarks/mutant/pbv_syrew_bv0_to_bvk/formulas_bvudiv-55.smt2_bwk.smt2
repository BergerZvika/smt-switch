(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl s (bvnot s))) (distinct s (bvnot (bvudiv (_ bvk k) s)))))
(check-sat)