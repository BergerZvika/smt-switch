(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (bvneg t) t) t) (bvadd (bvshl s s) (bvshl t t))))
(check-sat)
(exit)