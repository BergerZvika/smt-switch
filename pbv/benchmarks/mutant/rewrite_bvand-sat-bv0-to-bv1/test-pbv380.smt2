(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand (_ bv1 k) (bvadd s (_ bv1 k))) s) (bvor (_ bv1 k) (bvsub (_ bv1 k) s))))
(check-sat)
(exit)