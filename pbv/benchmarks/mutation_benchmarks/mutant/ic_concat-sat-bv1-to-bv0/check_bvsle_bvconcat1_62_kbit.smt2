(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvnot (bvlshr (bvnot (int_to_pbv m 0)) (int_to_pbv m 0)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
(bvsle s ts)
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (bvsle (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec m))) (bvsle (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
