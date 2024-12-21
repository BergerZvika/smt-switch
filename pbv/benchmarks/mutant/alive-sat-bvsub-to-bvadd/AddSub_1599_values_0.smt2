(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (= C (bvadd (_ bvk k) (_ bv1 k))) (not (= (bvsub (_ bv0 k) (bvlshr %x C)) (bvashr %x C)))))
(check-sat)