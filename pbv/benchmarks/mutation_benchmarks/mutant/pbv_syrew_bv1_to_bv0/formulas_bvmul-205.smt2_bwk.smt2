(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct t (bvshl (bvmul s t) (_ bv0 k))) (bvult (bvlshr s s) t)))
(check-sat)
