(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvlshr s s) (bvlshr s t)) (_ bvk k)))
(check-sat)