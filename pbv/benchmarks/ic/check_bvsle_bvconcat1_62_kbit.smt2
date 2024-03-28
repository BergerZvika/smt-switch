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
(bvsle s ts)
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec 62))) (bvsle (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec 62))) (bvsle (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
