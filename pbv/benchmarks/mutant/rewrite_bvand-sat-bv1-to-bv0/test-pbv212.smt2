(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (_ bv0 k) (bvand s (bvsub s (_ bv1 k)))) (bvor (_ bv1 k) (bvand s (bvsub s (_ bv1 k))))))
(check-sat)
(exit)