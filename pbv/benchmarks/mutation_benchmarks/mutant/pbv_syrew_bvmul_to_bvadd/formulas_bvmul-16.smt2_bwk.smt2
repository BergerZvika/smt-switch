(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvand s (bvadd s s))) (bvult (_ bv1 k) s)))
(check-sat)
