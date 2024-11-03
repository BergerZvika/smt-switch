(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF13 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge (bvadd x (bvneg s)) t))


(assert (= t (bvurem x s)))
(assert (not (lemma_UREM_REF13 x s t)))
(assert (>= k 4))
(check-sat)
