(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul t t) (bvneg (_ bv0 k))) (bvsub (bvlshr s s) (bvmul t t))))
(check-sat)
(exit)