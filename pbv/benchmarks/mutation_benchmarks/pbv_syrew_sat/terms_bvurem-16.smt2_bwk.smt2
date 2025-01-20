(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand t (bvurem s (_ bv0 k))) (bvand s t))))
(check-sat)
