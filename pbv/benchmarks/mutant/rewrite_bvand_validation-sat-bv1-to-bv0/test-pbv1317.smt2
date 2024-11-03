(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (_ bv0 k) (bvnot s))) (bvlshr (_ bv1 k) (bvnot s))))
(check-sat)
(exit)