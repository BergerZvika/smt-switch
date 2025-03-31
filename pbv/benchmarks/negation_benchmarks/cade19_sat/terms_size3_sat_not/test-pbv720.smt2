(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvadd (bvshl t s) t)) (bvand s t))))
(check-sat)
(exit)