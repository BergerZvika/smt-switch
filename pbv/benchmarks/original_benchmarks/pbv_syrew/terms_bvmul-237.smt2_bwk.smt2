(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvmul s s) (bvshl t s)) (bvmul s (bvlshr s (bvshl t s)))))
(check-sat)
