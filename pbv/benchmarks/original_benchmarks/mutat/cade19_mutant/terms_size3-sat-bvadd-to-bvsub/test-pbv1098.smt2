(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvand (bvshl t s) s)) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)