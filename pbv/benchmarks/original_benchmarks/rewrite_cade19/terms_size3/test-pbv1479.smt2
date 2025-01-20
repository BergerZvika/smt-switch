(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s (bvadd t t)) t) (bvmul s (bvshl (bvadd t t) t))))
(check-sat)
(exit)