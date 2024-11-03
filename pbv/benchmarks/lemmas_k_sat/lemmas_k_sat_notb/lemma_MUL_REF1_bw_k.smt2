(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REF1 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct s (bvnot (bvor t (bvand (_ bv1 k) (bvor x s))))))

(assert (= t (bvmul x s)))
(assert (not (not (lemma_MUL_REF1 x s t))))
(assert (>= k 4))
(check-sat)
