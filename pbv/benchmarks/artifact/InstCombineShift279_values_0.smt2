(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (and (bvult C (_ bv4 k)) (not (= (bvshl (bvlshr %X C) C) (bvand %X (bvshl (_ bv15 k) C))))))
(check-sat)