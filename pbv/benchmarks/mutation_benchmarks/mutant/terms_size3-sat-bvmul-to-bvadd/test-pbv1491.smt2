(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvadd s (bvshl t t)) t) (bvadd (bvmul s (bvshl t t)) t)))
(check-sat)
(exit)