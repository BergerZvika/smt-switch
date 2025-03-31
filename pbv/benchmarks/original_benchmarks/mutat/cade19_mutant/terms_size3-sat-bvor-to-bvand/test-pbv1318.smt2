(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s t) (bvshl s s)) (bvlshr s (bvand t (bvshl s s)))))
(check-sat)
(exit)