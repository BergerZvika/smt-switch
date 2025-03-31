
(set-logic ALL)
(declare-const k Int)

(declare-const s (_ BitVec k))
(declare-const tn (_ BitVec 2))
(declare-const tx (_ BitVec k))
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

(define-fun w () (_ BitVec k)
 (int_to_pbv k k)
)

(define-fun IC ((s (_ BitVec k)) (tx (_ BitVec k)) (tn (_ BitVec 2)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 (and
  (or
   (and (= tn (int_to_pbv 2 0)) (= (pextract (- k 1) (- k 1)  tx) (int_to_pbv 1 0)))
   (and (= tn (bvnot (int_to_pbv 2 0))) (= (pextract (- k 1) (- k 1)  tx) (int_to_pbv 1 1)))
  )
  (mcb xlo xhi tx)
 )
)

(define-fun LIT ((x (_ BitVec k))) Bool
 (= (psign_extend 2 x) (concat tn tx))
)

; valid xlo/xhi pairs
(assert (not (and (= (bvor (bvnot xlo) xhi) ones) 
  (distinct
  (IC s tx tn xlo xhi)
  (exists ((x (_ BitVec k)))
   (and
    (mcb xlo xhi x)
    (LIT x)
   )
  )
 )
)))
(check-sat)
(exit)

