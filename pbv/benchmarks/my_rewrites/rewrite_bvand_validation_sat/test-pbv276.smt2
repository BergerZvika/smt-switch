(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvand s (bvnot t))) t) (bvshl (bvshl s s) (bvand t (bvnot s))))))
(check-sat)
(exit)