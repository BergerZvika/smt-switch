(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvsub s (bvadd t (_ bv1 k)))) (bvsub s (bvand s (bvsub t s))))))
(check-sat)
(exit)