(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvmul s s) (bvsub (_ bv1 k) (_ bv1 k))) (bvadd (_ bv1 k) (bvadd (_ bv1 k) (bvmul s s)))))
(check-sat)
(exit)