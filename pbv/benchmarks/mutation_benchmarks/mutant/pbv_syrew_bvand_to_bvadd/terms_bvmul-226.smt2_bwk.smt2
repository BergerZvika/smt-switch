(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd (bvlshr s s) (bvmul s t)) (_ bv0 k)))
(check-sat)
