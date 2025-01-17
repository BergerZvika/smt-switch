(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %Y () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (not (= (bvshl (bvxor %Y (bvadd (bvlshr %X C) C2)) C) (bvxor (bvand %X (bvshl C2 C)) (bvshl %Y C))))))
(check-sat)