(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (not (= (bvadd C C1) (_ bv0 k))) (not (= (bvor (bvand %x C1) C) (bvand (bvor %x C) (bvor C C1))))))
(check-sat)