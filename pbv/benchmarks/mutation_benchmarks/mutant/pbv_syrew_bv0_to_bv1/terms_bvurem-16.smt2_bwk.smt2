(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand t (bvurem s (_ bv1 k))) (bvand s t)))
(check-sat)
