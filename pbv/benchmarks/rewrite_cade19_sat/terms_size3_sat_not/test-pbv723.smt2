(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvadd (bvshl t s) t)) (bvshl s (bvadd t (bvshl t s))))))
(check-sat)
(exit)