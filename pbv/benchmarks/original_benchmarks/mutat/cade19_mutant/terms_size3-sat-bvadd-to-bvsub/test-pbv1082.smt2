(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvand t (bvshl s t))) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)