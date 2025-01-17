(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand s t) (bvadd t (_ bv1 k))) (bvsub s (bvadd (_ bv1 k) (bvand s t)))))
(check-sat)
(exit)