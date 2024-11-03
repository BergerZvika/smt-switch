(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %Z () (_ BitVec k))
(declare-fun %RHS () (_ BitVec k))
(assert (not (= (bvadd (bvadd (bvxor (bvand %Z C1) C1) (_ bv0 k)) %RHS) (bvsub %RHS (bvor %Z (bvnot C1))))))
(check-sat)