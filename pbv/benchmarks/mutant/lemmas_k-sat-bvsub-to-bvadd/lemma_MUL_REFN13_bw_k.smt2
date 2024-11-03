(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REFN13 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct s (bvadd (_ bv1 k) (bvshl s (bvadd x t)))))


(assert (= t (bvmul x s)))
(assert (not (lemma_MUL_REFN13 x s t)))
(assert (>= k 4))
(check-sat)
