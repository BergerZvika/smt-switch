(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REF15 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvor (bvnot (_ bv1 k)) (bvxor x s))))

(assert (= t (bvmul x s)))(assert (not (lemma_MUL_REF15 x s t)))
(check-sat)
