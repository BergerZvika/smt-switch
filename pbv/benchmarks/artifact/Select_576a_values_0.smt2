(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (= (ite (bvslt %X (_ bv0 k)) C2 C1) (bvadd (bvand (bvashr %X (bvsub (_ bv4 k) (_ bv1 k))) (bvsub C2 C1)) C1))))
(check-sat)