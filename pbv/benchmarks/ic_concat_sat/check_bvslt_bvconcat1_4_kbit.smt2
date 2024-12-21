(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec k))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec k)
  (bvnot (bvlshr (bvnot (_ bv0 k)) (_ bv1 k)))
)
(define-fun max () (_ BitVec k)
  (bvnot min)
)

(define-fun SC () Bool
(and (bvsle s ts) (=> (= s ts) (distinct tx (_ bv0 k))))
)

(assert (not
 (not
  (and
   (=> SC (exists ((x (_ BitVec k))) (bvslt (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec k))) (bvslt (concat s x) (concat ts tx))) SC)
  )
 )
))
(check-sat)
