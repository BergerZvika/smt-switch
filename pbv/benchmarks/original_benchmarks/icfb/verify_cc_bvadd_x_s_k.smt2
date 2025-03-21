
(set-logic ALL)
(declare-const k Int)

(declare-const inv_s (_ BitVec k))
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
 (bvnot zero)
)

(define-fun mins () (_ BitVec k)
 (bvnot (bvlshr ones one))
)

(define-fun maxs () (_ BitVec k)
 (bvnot mins)
)

(define-fun w () (_ BitVec k)
 (int_to_pbv k k)
)

(define-fun msb ((v (_ BitVec k))) (_ BitVec 1)
 (pextract (- k 1) (- k 1)  v)
)

(define-fun CC ((t (_ BitVec k)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 true
)

(define-fun LIT ((x (_ BitVec k)) (s (_ BitVec k))) Bool
 (= (bvadd x s) t)
)

; valid xlo/xhi pairs
(assert (= (bvor (bvnot xlo) xhi) ones))

(assert
 (distinct
  (CC t xlo xhi)
  (exists ((x (_ BitVec k)) (s (_ BitVec k)))
   (and
    (mcb xlo xhi x)
    (LIT x s)
   )
  )
 )
)

(assert (> k 0))
(check-sat)
(exit)

