(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF30 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct x (bvadd t (bvand s (bvadd x s)))))


(assert (= t (bvudiv x s)))
(assert (not (lemma_UDIV_REF30 x s t)))
(assert (>= k 4))
(check-sat)
