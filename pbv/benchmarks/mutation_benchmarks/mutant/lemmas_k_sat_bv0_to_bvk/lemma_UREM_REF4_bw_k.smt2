(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF4 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (= s x) (= t (_ bvk k))))
(assert (= t (bvurem x s)))
(assert (not (lemma_UREM_REF4 x s t)))
(check-sat)
