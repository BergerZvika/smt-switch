(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (not (and (bvult C1 C2) (not (or (bvugt %X C1) (bvult %X C2))))))
(check-sat)