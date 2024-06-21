(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF29 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge x (bvshl t (bvnot (bvxor x s)))))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF29 x s t)) (>= k 4))))
(check-sat)
