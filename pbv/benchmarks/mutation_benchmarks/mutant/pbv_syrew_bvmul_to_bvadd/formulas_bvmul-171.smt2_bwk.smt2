(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr (bvadd t t) t)) (bvule s (bvshl (bvlshr t s) t))))
(check-sat)
