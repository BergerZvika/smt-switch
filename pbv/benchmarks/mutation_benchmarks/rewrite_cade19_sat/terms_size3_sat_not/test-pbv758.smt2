(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvmul (bvadd t t) t)) (bvshl s (bvmul t (bvadd t t))))))
(check-sat)
(exit)