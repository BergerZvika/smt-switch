(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (ite (bvsgt %X (bvnot (_ bv0 k))) C1 C2) (bvadd (bvand (bvashr %X (bvsub (_ bvk k) (_ bv0 k))) (bvsub C2 C1)) C1))))
(check-sat)