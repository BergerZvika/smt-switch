(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul (bvadd s t) (bvadd (_ bv1 k) (_ bv1 k))) (bvadd s (bvadd s (bvadd t t))))))
(check-sat)
(exit)