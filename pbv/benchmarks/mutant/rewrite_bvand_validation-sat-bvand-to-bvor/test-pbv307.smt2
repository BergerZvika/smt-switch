(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor s (bvshl t (bvnot t))) s) (bvshl (bvand s (bvshl s (bvnot t))) s)))
(check-sat)
(exit)