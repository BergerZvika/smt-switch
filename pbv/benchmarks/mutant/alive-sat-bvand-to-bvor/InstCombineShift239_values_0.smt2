(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (not (= (bvlshr (bvshl %X C) C) (bvor %X (bvlshr (bvnot (_ bv0 k)) C))))))
(check-sat)