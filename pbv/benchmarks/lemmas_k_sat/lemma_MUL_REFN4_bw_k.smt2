(set-logic ALL)
(declare-const k Int)(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_REFN4 ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (= s (bvshl s (bvand x (bvlshr (_ bv1 k) t)))))

(assert (not (and (= t (bvmul x s)) (not (lemma_MUL_REFN4 x s t)) (>= k 4))))
(check-sat)
