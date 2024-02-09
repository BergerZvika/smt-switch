(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF23 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge t (bvlshr (bvshl x (_ bv1 k)) s)))

(assert (= t (bvudiv x s)))(assert (not (lemma_UDIV_REF23 x s t)))
(check-sat)