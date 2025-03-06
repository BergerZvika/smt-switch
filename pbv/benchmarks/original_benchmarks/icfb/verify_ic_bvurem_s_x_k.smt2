
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
 (= (pextract 0 0  v) (_ bv1 1))
)

(define-fun zero () (_ BitVec k)
 (_ bv0 k)
)

(define-fun one () (_ BitVec k)
 (_ bv1 k)
)

(define-fun ones () (_ BitVec k)
 (bvnot zero)
)

(define-fun w () (_ BitVec k)
 (_ bvk k)
)

(define-fun addo ((a (_ BitVec k)) (b (_ BitVec k))) Bool
 (let ((zext_a (pzero_extend 1 a)) (zext_b (pzero_extend 1 b)))
  (= (pextract k k  (bvadd zext_a zext_b)) (_ bv1 1))
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
  (bvuge (bvand (bvsub (bvadd t t) s) s) t)
  (=>
   (= s t)
   (or (= xlo zero) (bvugt xhi t))
  )
  (=>
   (distinct s t)
   (exists ((y (_ BitVec k)))
    (and
     (mcb xlo xhi y)
     (bvugt y t)
     (= (bvurem (bvsub s t) y) zero)
    )
   )
  )
 )
)

(define-fun LIT ((x (_ BitVec k))) Bool
 (= (bvurem s x) t)
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


(assert (> k 0))
(check-sat)
(exit)

