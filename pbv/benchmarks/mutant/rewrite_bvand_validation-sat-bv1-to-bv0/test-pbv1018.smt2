(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvnot (bvand t (_ bv0 k))) t)) (bvshl s (bvshl (bvnot t) t))))
(check-sat)
(exit)