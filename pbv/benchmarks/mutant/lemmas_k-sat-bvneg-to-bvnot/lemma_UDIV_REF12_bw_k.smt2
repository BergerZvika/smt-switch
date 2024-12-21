(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF12 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge (bvand x (bvnot t)) (bvand s t)))


(assert (= t (bvudiv x s)))
(assert (not (lemma_UDIV_REF12 x s t)))
(assert (>= k 4))
(check-sat)
