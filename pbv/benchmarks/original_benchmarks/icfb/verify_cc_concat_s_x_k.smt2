
(set-logic ALL)
(declare-const k Int)

(declare-const tx (_ BitVec k))
(declare-const ts (_ BitVec k))
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

(define-fun CC ((tx (_ BitVec k)) (ts (_ BitVec k)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 (mcb xlo xhi tx)
)

(define-fun LIT ((x (_ BitVec k)) (s (_ BitVec k))) Bool
 (= (concat s x) (concat ts tx))
)

; valid xlo/xhi pairs
(assert (= (bvor (bvnot xlo) xhi) ones))

(assert
 (distinct
  (CC tx ts xlo xhi)
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

