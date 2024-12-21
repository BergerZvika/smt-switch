(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvnot (bvand s (_ bv1 k))) s)) (bvshl s (bvshl (bvnot s) s))))
(check-sat)
(exit)