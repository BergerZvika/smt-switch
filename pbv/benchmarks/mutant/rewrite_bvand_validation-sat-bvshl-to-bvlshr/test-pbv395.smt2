(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl t (bvand s (bvshl s s))) s) (bvand (bvnot s) (bvshl t s))))
(check-sat)
(exit)