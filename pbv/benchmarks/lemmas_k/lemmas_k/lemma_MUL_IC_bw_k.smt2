(set-logic ALL)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_IC ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (= (bvand (bvor (bvneg s) s) t) t))

(assert (= t (bvmul x s)))(assert (not (lemma_MUL_IC x s t)))
(check-sat)
