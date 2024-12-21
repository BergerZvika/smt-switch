(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvshl (bvnot t) s) t)) (bvand s (bvshl s (bvshl (bvshl s s) t))))))
(check-sat)
(exit)