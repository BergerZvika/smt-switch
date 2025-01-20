(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF4 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (and (= x (_ bv0 k)) (distinct s (_ bv0 k))) (= t (_ bv0 k))))
(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF4 x s t)))))
(check-sat)