(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %Y () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bv4 k)) (not (= (bvshl (bvor (bvand (bvlshr %X C) C2) %Y) C) (bvor (bvand %X (bvshl C2 C)) (bvshl %Y C))))))
(check-sat)