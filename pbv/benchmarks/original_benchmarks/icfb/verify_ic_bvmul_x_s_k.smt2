
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

(define-fun IC ((s (_ BitVec k)) (t (_ BitVec k)) (xlo (_ BitVec k)) (xhi (_ BitVec k))) Bool
 (and
  (= (bvand (bvor (bvneg s) s) t) t)
  (or
   (= s zero)
   (and
    (=>
     (odd s)
     (exists ((inv_s (_ BitVec k)))
      (and
       ; modular inverse of s
       (= (bvmul s inv_s) one)
       (mcb xlo xhi (bvmul t inv_s))
      )
     )
    )
    (=>
     (not (odd s))
     (exists ((inv_s_ctz_s (_ BitVec k)))
      (and
       ; modular inverse of (bvlshr s (ctz s))
       (= (bvmul (bvlshr s (ctz s)) inv_s_ctz_s) one)
       (mcb
        (bvshl xlo (ctz s))
        (bvshl xhi (ctz s))
        (bvshl (bvmul (bvlshr t (ctz s)) inv_s_ctz_s) (ctz s)))
      )
     )
    )
   )
  )
 )
)

(define-fun LIT ((x (_ BitVec k))) Bool
 (= (bvmul x s) t)
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

