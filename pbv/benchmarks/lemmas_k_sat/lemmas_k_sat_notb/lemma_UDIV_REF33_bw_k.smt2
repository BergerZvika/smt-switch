(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF33 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct x (bvadd t (bvadd t (bvor x s)))))


(assert (= t (bvudiv x s)))
(assert (not (not (lemma_UDIV_REF33 x s t))))
(assert (>= k 4))
(check-sat)
