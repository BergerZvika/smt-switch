(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvadd (bvlshr t s) t)) (bvmul s (bvadd t (bvlshr t s))))))
(check-sat)
(exit)