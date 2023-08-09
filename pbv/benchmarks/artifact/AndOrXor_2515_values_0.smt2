(set-logic ALL)
(declare-const k Int)
(declare-fun C3 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (bvult C2 (_ bv4 k)) (not (= (bvxor (bvlshr (bvxor %x C1) C2) C3) (bvxor (bvlshr %x C2) (bvxor (bvlshr C1 C2) C3))))))
(check-sat)