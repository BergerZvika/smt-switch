(set-logic ALL)

(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))

(define-fun udivtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (int_to_pbv k 0)) (bvnot (int_to_pbv k 0)) (bvudiv a b))
)
(define-fun uremtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (int_to_pbv k 0)) a (bvurem a b))
)
(define-fun min () (_ BitVec k)
  (bvnot (bvlshr (bvnot (int_to_pbv k 0)) (int_to_pbv k 0)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC ((s (_ BitVec k)) (t (_ BitVec k))) Bool
(and (=> (bvsge s (int_to_pbv k 0)) (bvsgt s t)) (=> (bvslt s (int_to_pbv k 0)) (bvsgt (bvlshr (bvsub s (int_to_pbv k 1)) (int_to_pbv k 1)) t)))
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec k))) (bvsgt (uremtotal s x) t)))
  (=> (exists ((x (_ BitVec k))) (bvsgt (uremtotal s x) t)) (SC s t))
  )
 )
)
(check-sat)
