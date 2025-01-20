(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvnot (bvshl (bvnot (_ bv0 m)) (_ bv1 m)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
(and (bvsle s ts) (=> (= s ts) (distinct tx (_ bv0 m))))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (bvslt (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec m))) (bvslt (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)