(set-logic ALL)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(declare-const i (_ BitVec k))
(define-fun lemma_UDIV_HC1 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (= s (bvshl (_ bv1 k) i)) (= t (bvlshr x i))))
(assert (>= i (_ bv0 k)))
(assert (< i (_ bvk k)))
(assert (= t (bvudiv x s)))
(assert (not (not (lemma_UDIV_HC1 x s t))))
(check-sat)
