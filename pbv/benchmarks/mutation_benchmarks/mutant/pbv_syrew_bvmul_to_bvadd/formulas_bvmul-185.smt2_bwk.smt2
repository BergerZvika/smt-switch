(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct t (bvadd s (bvnot t))) (distinct s (bvmul t (bvnot s)))))
(check-sat)
