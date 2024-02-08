(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REF18 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct x (bvsub (_ bv1 k) (bvshl x (bvsub s t)))))

(assert (= t (bvmul x s)))(assert (not (lemma_MUL_REF18 x s t)))
(check-sat)
