(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand t (bvnot (bvshl t t))) s) (bvand (bvnot s) (bvshl t s))))
(check-sat)
(exit)