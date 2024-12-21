(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s s) (bvnot (bvshl t s))) (bvshl (bvand s (bvnot t)) s)))
(check-sat)
(exit)