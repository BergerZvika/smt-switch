(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UREM_REF11 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge (bvand t (bvor x s)) (bvand t (_ bv0 k))))


(assert (= t (bvurem x s)))
(assert (not (lemma_UREM_REF11 x s t)))
(assert (>= k 4))
(check-sat)
