(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct t (bvshl (bvmul s t) (_ bv1 k))) (bvult (bvlshr s s) t))))
(check-sat)