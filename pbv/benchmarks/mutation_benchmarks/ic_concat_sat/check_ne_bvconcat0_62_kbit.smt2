(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvnot (bvlshr (bvnot (_ bv0 m)) (_ bv1 m)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
true
)

(assert (not
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (distinct (concat x s) (concat tx ts))))
   (=> (exists ((x (_ BitVec m))) (distinct (concat x s) (concat tx ts))) SC)
  )
 )
))
(check-sat)