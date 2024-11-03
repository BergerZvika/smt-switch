(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvand (_ bv1 k) (bvadd t (_ bv1 k)))) (bvshl s (bvand (_ bv1 k) (bvnot t)))))
(check-sat)
(exit)