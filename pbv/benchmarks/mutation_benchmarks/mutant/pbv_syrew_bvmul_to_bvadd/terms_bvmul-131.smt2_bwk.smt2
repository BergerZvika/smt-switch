(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvand t (_ bv1 k)) t)) (bvshl s (bvadd t (bvshl t t)))))
(check-sat)
