(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec k))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec k)
  (bvnot (bvshl (bvnot (_ bv0 k)) (_ bv1 k)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC () Bool
(=> (= tx (bvnot (_ bv0 k))) (bvuge s ts))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec k))) (bvuge (concat x s) (concat tx ts))))
   (=> (exists ((x (_ BitVec k))) (bvuge (concat x s) (concat tx ts))) SC)
  )
 )
)
(check-sat)
