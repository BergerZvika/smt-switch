(set-logic ALL)
(declare-const k Int)
(declare-fun %a () (_ BitVec k))
(assert (not (= (bvadd (bvnot (_ bv0 k)) %a) (bvxor %a (bvnot (_ bv0 k))))))
(check-sat)