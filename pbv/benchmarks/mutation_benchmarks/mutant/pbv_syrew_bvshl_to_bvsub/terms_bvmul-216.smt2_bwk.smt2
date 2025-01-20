(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvsub s s) (bvlshr s t)) (bvmul s (bvshl (bvlshr s t) s))))
(check-sat)
