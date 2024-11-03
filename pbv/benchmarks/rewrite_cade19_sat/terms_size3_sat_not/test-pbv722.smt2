(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvadd (bvshl t s) t)) (bvor s (bvadd t (bvshl t s))))))
(check-sat)
(exit)