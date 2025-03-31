
(set-logic ALL)
(declare-const k Int)

(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(declare-const xlo (_ BitVec k))
(declare-const xhi (_ BitVec k))

(define-fun mcb ((xlo (_ BitVec k)) (xhi (_ BitVec k)) (v (_ BitVec k))) Bool
 (and
  (= (bvand xhi v) v)
  (= (bvor xlo v) v)
 )
)





(define-fun odd ((v (_ BitVec k))) Bool
 (= (pextract 0 0  v) (int_to_pbv 1 1))
)

(define-fun zero () (_ BitVec k)
 (int_to_pbv k 0)
)

(define-fun one () (_ BitVec k)
 (int_to_pbv k 1)
)

(define-fun ones () (_ BitVec k)
 (bvneg zero)
)

(define-fun w () (_ BitVec k)
 (_ bvk k)
)

(define-fun addo ((a (_ BitVec k)) (b (_ BitVec k))) Bool
 (let ((zext_a (pzero_extend 1 a)) (zext_b (pzero_extend 1 b)))
  (= (pextract k k  (bvadd zext_a zext_b)) (int_to_pbv 1 1))
 )
)

(define-fun mulo ((a (_ BitVec k)) (b (_ BitVec k))) Bool
 (let ((zext_a (pzero_extend k a)) (zext_b (pzero_extend k b)))
  (distinct
   (pextract (- k 1) 0  (bvlshr (bvmul zext_a zext_b) (pzero_extend k (_ bvk k))))
   zero
  )
 )
)

(define-fun IC ((s (_ BitVec k)) (t (_ BitVec k)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 (and
  (bvuge (bvnot (bvneg s)) t)
  (=>
   (or (= s zero) (= t ones))
   (mcb xlo xhi t)
  )
  (=>
   (and
    (distinct s zero)
    (distinct t ones)
   )
   (exists ((y (_ BitVec k)))
    (and
     (mcb xlo xhi (bvadd (bvmul s y) t))
     (not (mulo s y))
     (not (addo (bvmul s y) t))
    )
   )
  )
 )
)

(define-fun LIT ((x (_ BitVec k))) Bool
 (= (bvurem x s) t)
)

; valid xlo/xhi pairs
(assert (= (bvor (bvnot xlo) xhi) ones))

(assert
 (distinct
  (IC s t xlo xhi)
  (exists ((x (_ BitVec k)))
   (and
    (mcb xlo xhi x)
    (LIT x)
   )
  )
 )
)



(check-sat)
(exit)

