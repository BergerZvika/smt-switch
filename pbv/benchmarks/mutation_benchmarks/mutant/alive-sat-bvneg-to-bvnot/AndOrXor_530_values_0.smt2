(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (= (bvand C (bvsub C (_ bv1 k))) (_ bv0 k)) (not (= (bvult %X C) (= (bvand %X (bvnot C)) (_ bv0 k)))) (not (= C (_ bv0 k)))))
(check-sat)