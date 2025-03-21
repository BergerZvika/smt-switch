(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvneg (bvlshr (bvnot (int_to_pbv m 0)) (int_to_pbv m 1)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
(and (bvuge s ts) (=> (= s ts) (distinct tx (bvnot (int_to_pbv m 0)))))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (bvugt (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec m))) (bvugt (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
