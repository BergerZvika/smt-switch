(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (and (bvult C (_ bvk k)) (not (= (bvshl (bvadd %X C2) C) (bvadd (bvshl %X C) (bvshl C2 C)))))))
(check-sat)