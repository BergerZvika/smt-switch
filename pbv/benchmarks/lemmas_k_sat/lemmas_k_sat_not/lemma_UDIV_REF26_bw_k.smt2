(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF26 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge x (bvxor t (bvlshr t (bvlshr s (_ bv1 k))))))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF26 x s t)) (>= k 4))))
(check-sat)
