(set-logic ALL)

(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvnot (bvshl (bvnot (int_to_pbv m 0)) (int_to_pbv m 1)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
(=> (= tx (int_to_pbv m 0)) (bvult s ts))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (bvult (concat x s) (concat tx ts))))
   (=> (exists ((x (_ BitVec m))) (bvult (concat x s) (concat tx ts))) SC)
  )
 )
)
(check-sat)
