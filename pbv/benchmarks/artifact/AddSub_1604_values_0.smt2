(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (and (bvult C (_ bvk k)) (= C (bvsub (_ bvk k) (_ bv1 k))) (not (= (bvsub (_ bv0 k) (bvashr %x C)) (bvlshr %x C)))))
(check-sat)