(set-logic QF_BV)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF14 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge (bvxor (bvneg s) (bvor x s)) t))

(assert (= t (bvurem x s)))(assert (not (lemma_UREM_REF14 x s t)))
(check-sat)
