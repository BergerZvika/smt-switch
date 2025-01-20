(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand t (bvurem t (_ bv0 k)))) (distinct s t))))
(check-sat)
