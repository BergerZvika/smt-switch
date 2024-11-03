(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor s t) (bvshl t (bvnot t))) (bvand s (bvshl t (bvshl t (bvnot t))))))
(check-sat)
(exit)