(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvshl s s) (bvshl t s)) t) (bvshl (bvand s (bvshl s t)) s))))
(check-sat)
(exit)