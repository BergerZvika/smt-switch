(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s (bvshl t t)) t) (bvlshr s (bvand t (bvadd t t)))))
(check-sat)
(exit)