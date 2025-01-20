(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvadd (bvshl s t) s)) (= s (bvsub (bvshl s t) t))))
(check-sat)
(exit)