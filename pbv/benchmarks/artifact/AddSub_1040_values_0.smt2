(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %Z () (_ BitVec k))
(declare-fun %RHS () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (and (= C2 (bvnot C1)) (not (= (bvadd (bvadd (bvxor (bvor %Z C2) C1) (_ bv1 k)) %RHS) (bvsub %RHS (bvand %Z C1))))))
(check-sat)