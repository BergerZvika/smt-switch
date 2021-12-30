(set-logic QF_UFBV)
(set-option :produce-models true)
(set-option :incremental true)

(declare-const k () Int)
(define-fun x () (_ BitVec k)
(define-fun y () (_ BitVec k)

(assert (= x y))
(check-sat)
(exit)