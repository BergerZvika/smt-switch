(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvlshr s (bvadd s s))) (bvmul s (bvshl t (bvadd s s)))))
(check-sat)
(exit)