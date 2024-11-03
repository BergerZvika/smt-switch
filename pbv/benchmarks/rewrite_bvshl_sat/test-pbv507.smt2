(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (_ bv0 k) (bvadd s (bvshl s s))) (distinct s (_ bv0 k)))))
(check-sat)
(exit)