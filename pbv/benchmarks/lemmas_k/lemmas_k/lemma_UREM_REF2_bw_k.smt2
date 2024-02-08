(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF2 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (= x (_ bv0 k)) (= t (_ bv0 k))))

(assert (= t (bvurem x s)))(assert (not (lemma_UREM_REF2 x s t)))
(check-sat)
