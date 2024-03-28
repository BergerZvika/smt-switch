(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec 62))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec 62)
  (bvnot (bvlshr (bvnot (_ bv0 62)) (_ bv1 62)))
)
(define-fun max () (_ BitVec 62)
  (bvnot min)
)

(define-fun SC () Bool
true
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec 62))) (distinct (concat x s) (concat tx ts))))
   (=> (exists ((x (_ BitVec 62))) (distinct (concat x s) (concat tx ts))) SC)
  )
 )
)
(check-sat)
