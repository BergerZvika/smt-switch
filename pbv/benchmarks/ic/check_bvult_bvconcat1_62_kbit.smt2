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
(and (bvule s ts) (=> (= s ts) (distinct tx (_ bv0 62))))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec 62))) (bvult (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec 62))) (bvult (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
