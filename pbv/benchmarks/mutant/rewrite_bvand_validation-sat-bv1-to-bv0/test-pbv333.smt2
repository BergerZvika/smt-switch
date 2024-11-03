(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvadd s (bvnot t))) (bvand (_ bv1 k) (bvnot (bvadd s t)))))
(check-sat)
(exit)