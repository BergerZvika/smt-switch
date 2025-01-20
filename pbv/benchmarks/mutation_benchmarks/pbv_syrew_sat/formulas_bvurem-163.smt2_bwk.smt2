(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvand t (bvurem s (_ bv0 k)))) (= s (bvand s t)))))
(check-sat)
