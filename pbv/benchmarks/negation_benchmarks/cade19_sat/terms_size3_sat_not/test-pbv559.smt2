(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvlshr (bvneg s) s)) (bvlshr (bvshl s s) s))))
(check-sat)
(exit)