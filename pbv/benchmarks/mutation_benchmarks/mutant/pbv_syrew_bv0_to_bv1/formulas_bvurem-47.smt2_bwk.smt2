(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (bvurem (_ bv1 k) s) t) (bvult (bvlshr s s) t)))
(check-sat)