(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF32 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge s (bvlshr (bvadd x t) t)))

(assert (= t (bvudiv x s)))(assert (not (lemma_UDIV_REF32 x s t)))
(check-sat)
