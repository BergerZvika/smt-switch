(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s (bvsub s t)) t) (bvlshr (bvlshr s t) (bvadd s t))))
(check-sat)
(exit)