(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REFN3 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvlshr (bvor s (_ bv1 k)) (bvshl t x))))


(assert (= t (bvmul x s)))
(assert (not (lemma_MUL_REFN3 x s t)))
(assert (>= k 4))
(check-sat)
