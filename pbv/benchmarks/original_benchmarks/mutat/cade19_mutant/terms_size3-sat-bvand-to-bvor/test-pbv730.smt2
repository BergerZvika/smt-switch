(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvor (bvshl t s) t)) (bvadd s (bvand t (bvshl t s)))))
(check-sat)
(exit)