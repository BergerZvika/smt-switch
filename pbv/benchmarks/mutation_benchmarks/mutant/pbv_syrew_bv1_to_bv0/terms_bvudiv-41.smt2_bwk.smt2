(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvnot (bvudiv t (bvlshr (_ bv0 k) t))) (bvudiv (bvlshr s s) t)))
(check-sat)
