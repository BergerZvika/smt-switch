(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF21 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (distinct x (bvnot (bvand x (bvshl t (_ bv1 k))))))
(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF21 x s t)) (> k 1))))
(check-sat)