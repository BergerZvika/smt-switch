(set-logic ALL)
(set-option :produce-models true)
(declare-const m Int)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun tx () (_ BitVec m))
(declare-fun ts () (_ BitVec k))

(define-fun min () (_ BitVec m)
  (bvnot (bvlshr (bvnot (_ bv0 m)) (_ bv0 m)))
)
(define-fun max () (_ BitVec m)
  (bvnot min)
)

(define-fun SC () Bool
(and (bvsge s ts) (=> (= s ts) (distinct tx (bvnot (_ bv0 m)))))
)

(assert
 (not
  (and
   (=> SC (exists ((x (_ BitVec m))) (bvsgt (concat s x) (concat ts tx))))
   (=> (exists ((x (_ BitVec m))) (bvsgt (concat s x) (concat ts tx))) SC)
  )
 )
)
(check-sat)
