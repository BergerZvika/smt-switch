(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvand t (bvudiv (_ bv0 k) s))) (= s (bvshl t s)))))
(check-sat)
