(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvmul s s) (bvsub s s)) (bvmul s (bvlshr s (bvshl s s)))))
(check-sat)
