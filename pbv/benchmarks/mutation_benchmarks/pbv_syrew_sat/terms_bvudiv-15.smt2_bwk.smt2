(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv (_ bv0 k) (bvudiv (_ bv0 k) s)) (bvnot (bvudiv (_ bv0 k) s)))))
(check-sat)
