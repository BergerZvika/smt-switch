(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvlshr s (bvlshr s (_ bv0 k)))) (bvlshr s (bvlshr s (bvand t (_ bv1 k))))))
(check-sat)
(exit)