(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand s t) (bvadd t (_ bv1 k))) (bvand s (bvsub (_ bv0 k) (bvadd t (_ bv1 k))))))
(check-sat)
(exit)