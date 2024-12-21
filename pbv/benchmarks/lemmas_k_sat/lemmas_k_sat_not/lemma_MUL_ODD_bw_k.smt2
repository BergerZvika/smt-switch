(set-logic ALL)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(define-fun lemma_MUL_ODD ((x (_ BitVec k)) (s (_ BitVec k)) (t (_ BitVec k))) Bool (= ((_ extract 0 0) t) (bvand ((_ extract 0 0) x) ((_ extract 0 0) s))))

(assert (not (and (= t (bvmul x s)) (not (lemma_MUL_ODD x s t)) (>= k 4))))
(check-sat)
