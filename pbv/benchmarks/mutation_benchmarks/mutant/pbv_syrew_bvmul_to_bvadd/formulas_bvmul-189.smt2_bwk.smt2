(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct t (bvshl s (bvadd s t))) (distinct s (bvshl t (bvmul s s)))))
(check-sat)
