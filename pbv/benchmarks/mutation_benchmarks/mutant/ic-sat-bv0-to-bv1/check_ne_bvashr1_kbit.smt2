(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))

(define-fun udivtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (int_to_pbv k 1)) (bvnot (int_to_pbv k 0)) (bvudiv a b))
)
(define-fun uremtotal ((a (_ BitVec k)) (b (_ BitVec k))) (_ BitVec k)
  (ite (= b (int_to_pbv k 0)) a (bvurem a b))
)
(define-fun min () (_ BitVec k)
  (bvnot (bvlshr (bvnot (int_to_pbv k 0)) (int_to_pbv k 1)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC ((s (_ BitVec k)) (t (_ BitVec k))) Bool
(and (or (not (= t (int_to_pbv k 0))) (not (= s (int_to_pbv k 0)))) (or (not (= t (bvnot (int_to_pbv k 0)))) (not (= s (bvnot (int_to_pbv k 0))))))
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec k))) (distinct (bvashr s x) t)))
  (=> (exists ((x (_ BitVec k))) (distinct (bvashr s x) t)) (SC s t))
  )
 )
)
(check-sat)
