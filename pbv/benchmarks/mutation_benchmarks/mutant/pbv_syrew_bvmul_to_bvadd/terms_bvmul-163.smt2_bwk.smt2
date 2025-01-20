(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd t (bvshl s (bvlshr s (_ bv1 k)))) (bvmul s (bvshl t (bvlshr s (_ bv1 k))))))
(check-sat)
