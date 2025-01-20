(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul (bvlshr s s) (bvlshr s t)) (_ bv0 k))))
(check-sat)
