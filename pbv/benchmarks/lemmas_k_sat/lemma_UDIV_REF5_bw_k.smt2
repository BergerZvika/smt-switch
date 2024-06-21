(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF5 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (distinct s (_ bv0 k)) (bvule t x)))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF5 x s t)) (>= k 4))))
(check-sat)
