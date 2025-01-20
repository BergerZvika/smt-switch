(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvshl t (_ bv0 k)) t)) (bvmul s (bvshl (bvshl t t) t))))
(check-sat)
