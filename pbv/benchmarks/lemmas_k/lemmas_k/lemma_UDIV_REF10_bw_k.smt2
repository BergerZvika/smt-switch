(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF10 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct (bvor s t) (bvand x (bvnot (_ bv1 k)))))

(assert (= t (bvudiv x s)))(assert (not (lemma_UDIV_REF10 x s t)))
(check-sat)
