(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvlshr (bvshl s s) s)) (bvand s (bvlshr (bvshl t s) s))))
(check-sat)
(exit)