(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_UDIV_REF37 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (bvuge (bvsub s (_ bv1 k)) (bvlshr x t)))

(assert (not (and (= t (bvudiv x s)) (not (lemma_UDIV_REF37 x s t)) (>= k 4))))
(check-sat)
