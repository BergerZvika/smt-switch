(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))

(define-fun udivtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (_ bv0 k)) (bvneg (_ bv0 k)) (bvudiv a b))
)
(define-fun uremtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (_ bv0 k)) a (bvurem a b))
)
(define-fun min () (_ BitVec k)
  (bvnot (bvlshr (bvnot (_ bv0 k)) (_ bv1 k)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC ((s (_ BitVec k)) (t (_ BitVec k))) Bool
(distinct t min)
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec k))) (bvslt (bvnot x) t)))
  (=> (exists ((x (_ BitVec k))) (bvslt (bvnot x) t)) (SC s t))
  )
 )
)
(check-sat)
