(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub t (bvlshr (bvand t (_ bv0 k)) s)) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)