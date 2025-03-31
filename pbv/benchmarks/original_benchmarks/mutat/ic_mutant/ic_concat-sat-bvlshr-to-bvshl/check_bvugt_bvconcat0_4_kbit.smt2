(set-logic ALL)

(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec k))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec k)
  (bvnot (bvshl (bvnot (int_to_pbv k 0)) (int_to_pbv k 1)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC () Bool
(=> (= tx (bvnot (int_to_pbv k 0))) (bvugt s ts))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec k))) (bvugt (concat x s) (concat tx ts))))
   (=> (exists ((x (_ BitVec k))) (bvugt (concat x s) (concat tx ts))) SC)
  )
 )
)
(check-sat)
