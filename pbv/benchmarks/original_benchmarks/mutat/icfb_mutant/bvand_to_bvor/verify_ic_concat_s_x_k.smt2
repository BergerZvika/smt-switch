
(set-logic ALL)
(declare-const k Int)

(declare-const s (_ BitVec k))
(declare-const tx (_ BitVec k))
(declare-const ts (_ BitVec k))
(declare-const xlo (_ BitVec k))
(declare-const xhi (_ BitVec k))

(define-fun mcb ((xlo (_ BitVec k)) (xhi (_ BitVec k)) (v (_ BitVec k))) Bool
 (and
  (= (bvor xhi v) v)
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

(define-fun IC ((s (_ BitVec k)) (tx (_ BitVec k)) (ts (_ BitVec k)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 (and
  (= s ts)
  (mcb xlo xhi tx)
 )
)

(define-fun LIT ((x (_ BitVec k))) Bool
 (= (concat s x) (concat ts tx))
)

; valid xlo/xhi pairs
(assert (= (bvor (bvnot xlo) xhi) ones))

(assert
 (distinct
  (IC s tx ts xlo xhi)
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

