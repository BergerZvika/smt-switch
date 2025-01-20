(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvshl (_ bv1 k) (bvadd s s))) (bvult (_ bv1 k) (bvmul s s))))
(check-sat)
