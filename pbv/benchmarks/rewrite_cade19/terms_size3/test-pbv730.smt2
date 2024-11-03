(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvand (bvshl t s) t)) (bvadd s (bvand t (bvshl t s)))))
(check-sat)
(exit)