(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (not (= (bvlshr (bvlshr %X C) C) (bvand %X (bvlshr (bvnot (_ bv0 k)) C))))))
(check-sat)