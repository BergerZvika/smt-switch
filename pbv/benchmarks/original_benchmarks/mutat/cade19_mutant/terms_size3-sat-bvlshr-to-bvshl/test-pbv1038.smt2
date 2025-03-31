(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvshl s (bvshl s s))) (bvand s (bvshl t (bvshl s s)))))
(check-sat)
(exit)