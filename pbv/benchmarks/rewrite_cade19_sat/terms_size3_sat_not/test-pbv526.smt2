(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvadd t (bvand t (_ bv0 k)))) (bvlshr s t))))
(check-sat)
(exit)