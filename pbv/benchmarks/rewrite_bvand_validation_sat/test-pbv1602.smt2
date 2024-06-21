(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand (_ bv1 k) (bvlshr s (_ bv1 k))) s) (bvshl (bvlshr s (_ bv1 k)) s))))
(check-sat)
(exit)