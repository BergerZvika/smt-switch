(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (and (bvult C1 C2) (bvult %a C1) (= %a C2)))
(assert true)
(check-sat)