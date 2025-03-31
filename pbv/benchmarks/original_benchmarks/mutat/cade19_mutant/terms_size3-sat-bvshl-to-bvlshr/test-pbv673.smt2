(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr (bvor s t) s)) (bvlshr s (bvshl s s))))
(check-sat)
(exit)