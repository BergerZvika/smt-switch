(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (and (bvslt C1 C2) (not (or (not (= %X C1)) (bvslt %X C2)))))
(assert true)
(check-sat)