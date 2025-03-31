(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvlshr (bvshl s s) s)) (bvlshr s (bvlshr (bvneg s) s)))))
(check-sat)
(exit)