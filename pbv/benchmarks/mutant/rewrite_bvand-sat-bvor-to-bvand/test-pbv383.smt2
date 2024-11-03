(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand (_ bv1 k) (bvsub (_ bv0 k) s)) (_ bv1 k)) (bvsub (_ bv0 k) (bvadd s (bvand s (_ bv1 k))))))
(check-sat)
(exit)