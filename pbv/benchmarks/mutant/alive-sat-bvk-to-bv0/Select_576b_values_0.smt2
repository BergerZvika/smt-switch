(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (ite (bvslt %X (_ bv0 k)) (bvnot (_ bv0 k)) C1) (bvor (bvashr %X (bvsub (_ bv0 k) (_ bv1 k))) C1))))
(check-sat)