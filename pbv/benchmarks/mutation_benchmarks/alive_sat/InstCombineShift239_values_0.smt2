(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (and (bvult C (_ bvk k)) (not (= (bvlshr (bvshl %X C) C) (bvand %X (bvlshr (bvnot (_ bv0 k)) C)))))))
(check-sat)