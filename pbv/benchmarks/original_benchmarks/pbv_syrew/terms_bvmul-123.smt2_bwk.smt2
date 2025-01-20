(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvmul t t) t)) (bvlshr s (bvmul t (bvshl t t)))))
(check-sat)
