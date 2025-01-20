(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvlshr (bvlshr (_ bv1 k) t) s)) (bvult s (bvadd t (bvlshr (_ bv1 k) s)))))
(check-sat)
