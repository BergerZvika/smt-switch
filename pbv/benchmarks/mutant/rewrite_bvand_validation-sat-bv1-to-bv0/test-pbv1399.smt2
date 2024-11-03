(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvshl s (bvadd t (_ bv1 k)))) (bvand (_ bv1 k) (bvshl s (bvnot t)))))
(check-sat)
(exit)