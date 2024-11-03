(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REF13 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvor (_ bv1 k) (bvadd x s))))

(assert (not (and (= t (bvmul x s)) (not (lemma_MUL_REF13 x s t)) (>= k 4))))
(check-sat)
