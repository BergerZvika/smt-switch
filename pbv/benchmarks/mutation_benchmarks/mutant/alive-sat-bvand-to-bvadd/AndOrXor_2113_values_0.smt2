(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvadd (bvxor %A (bvnot (_ bv0 k))) %B) %A) (bvor %A %B))))
(check-sat)