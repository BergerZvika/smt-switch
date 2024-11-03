(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr s t) (bvnot (bvshl t t))) (bvshl (bvand s (bvnot t)) t)))
(check-sat)
(exit)