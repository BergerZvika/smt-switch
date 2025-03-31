(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvand (bvshl t s) s)) (bvadd (bvshl s s) t)))
(check-sat)
(exit)