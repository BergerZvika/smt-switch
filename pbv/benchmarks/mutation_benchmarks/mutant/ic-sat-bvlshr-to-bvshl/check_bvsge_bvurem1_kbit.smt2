(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))

(define-fun udivtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (_ bv0 k)) (bvnot (_ bv0 k)) (bvudiv a b))
)
(define-fun uremtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (_ bv0 k)) a (bvurem a b))
)
(define-fun min () (_ BitVec k)
  (bvnot (bvshl (bvnot (_ bv0 k)) (_ bv1 k)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC ((s (_ BitVec k)) (t (_ BitVec k))) Bool
(and (=> (bvsge s (_ bv0 k)) (bvsge s t)) (=> (and (bvslt s (_ bv0 k)) (bvsge t (_ bv0 k))) (bvugt (bvsub s t) t)))
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec k))) (bvsge (uremtotal s x) t)))
  (=> (exists ((x (_ BitVec k))) (bvsge (uremtotal s x) t)) (SC s t))
  )
 )
)
(check-sat)
