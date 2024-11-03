(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand (_ bv1 k) (bvsub s (_ bv1 k))) t) (bvsub (bvor s (_ bv1 k)) (bvadd s t))))
(check-sat)
(exit)