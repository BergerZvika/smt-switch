(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF15 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge x (bvlshr (bvshl t (_ bv1 k)) (bvshl t s))))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF15 x s t)) (>= k 4))))
(check-sat)
