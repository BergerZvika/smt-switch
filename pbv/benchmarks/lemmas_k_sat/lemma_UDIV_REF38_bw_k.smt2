(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF38 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct x (bvsub (_ bv1 k) (bvshl x (bvsub x t)))))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF38 x s t)) (>= k 4))))
(check-sat)
