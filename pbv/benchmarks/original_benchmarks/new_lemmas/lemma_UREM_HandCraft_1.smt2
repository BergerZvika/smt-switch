(set-logic ALL)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(declare-const i Int)
(define-fun lemma_UREM_HC1 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (=> (= s (bvshl (_ bv1 k) (_ bvi k))) (= t (concat (_ bv0 (- k i)) (pextract (- i 1) 0 x)))))
(assert (>= i 0))
(assert (< i k))
(assert (= t (bvurem x s)))
(assert (not (lemma_UREM_HC1 x s t)))
(check-sat)
