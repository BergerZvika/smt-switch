(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct t (bvlshr (bvadd s t) s)) (bvult (bvlshr s s) t)))
(check-sat)
