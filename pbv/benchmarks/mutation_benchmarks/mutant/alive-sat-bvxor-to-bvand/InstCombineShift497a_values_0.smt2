(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (not (= (bvlshr (bvand %X C2) C) (bvxor (bvlshr %X C) (bvlshr C2 C))))))
(check-sat)