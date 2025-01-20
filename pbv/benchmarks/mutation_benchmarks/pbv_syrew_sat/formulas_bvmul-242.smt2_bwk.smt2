(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= (_ bv0 k) (bvshl s (bvshl (_ bv1 k) (_ bv1 k)))) (= (_ bv0 k) (bvmul s s)))))
(check-sat)
