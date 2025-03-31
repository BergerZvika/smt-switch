(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REF13 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvor (int_to_pbv k 1) (bvadd x s))))


(assert (= t (bvmul x s)))
(assert (not (not (lemma_MUL_REF13 x s t))))
(assert (> k 1))
(check-sat)
