(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (ite (bvsgt %X (bvnot (_ bv0 k))) C1 (bvnot (_ bv0 k))) (bvor (bvashr %X (bvsub (_ bvk k) (_ bv1 k))) C1))))
(check-sat)