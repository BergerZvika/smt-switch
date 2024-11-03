(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (_ bv1 k) (bvsub s (_ bv1 k))) (distinct s (_ bv1 k))))
(check-sat)
(exit)