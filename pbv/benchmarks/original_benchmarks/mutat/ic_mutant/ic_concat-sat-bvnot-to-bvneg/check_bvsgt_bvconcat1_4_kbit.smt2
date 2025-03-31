(set-logic ALL)

(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec k))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec k)
  (bvneg (bvlshr (bvnot (int_to_pbv k 0)) (int_to_pbv k 1)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC () Bool
(and (bvsge s ts) (=> (= s ts) (distinct tx (bvnot (int_to_pbv k 0)))))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec k))) (bvsgt (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec k))) (bvsgt (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
