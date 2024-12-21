(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (not (and (bvslt C1 C2) (= C1 (bvsub C2 (_ bv1 k))) (not (= (and (not (= %a C1)) (bvslt %a C2)) (bvslt %a C1))))))
(check-sat)