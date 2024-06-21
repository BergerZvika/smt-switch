(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF10 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvor (bvnot x) (bvneg s))))

(assert (not (and (= t (bvurem x s)) (not (lemma_UREM_REF10 x s t)) (>= k 4))))
(check-sat)
