(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REFN3 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct t (bvshl (bvor s (_ bv1 k)) (bvshl t x))))

(assert (not (and (= t (bvmul x s)) (not (lemma_MUL_REFN3 x s t)) (>= k 4))))
(check-sat)
