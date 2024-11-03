(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF9 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvnot (bvand s (bvnot x)))))


(assert (= t (bvudiv x s)))
(assert (not (lemma_UDIV_REF9 x s t)))
(assert (>= k 4))
(check-sat)
