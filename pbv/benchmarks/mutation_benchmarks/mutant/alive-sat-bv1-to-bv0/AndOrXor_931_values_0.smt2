(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (and (bvult C1 C2) (= C1 (bvsub C2 (_ bv0 k))) (not (= (and (not (= %a C1)) (bvult %a C2)) (bvult %a C1)))))
(check-sat)