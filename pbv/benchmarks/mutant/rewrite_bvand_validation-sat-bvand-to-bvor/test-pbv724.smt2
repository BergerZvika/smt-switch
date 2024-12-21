(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl t (bvshl (bvnot (_ bv0 k)) t))) (bvshl s (bvor t (bvshl t (bvshl t t))))))
(check-sat)
(exit)