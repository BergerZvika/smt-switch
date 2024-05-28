(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvsub (_ bv0 k) s) (bvadd (_ bv1 k) (_ bv1 k))) (bvand (bvadd s (_ bv1 k)) (bvadd (_ bv1 k) (_ bv1 k)))))
(check-sat)
(exit)