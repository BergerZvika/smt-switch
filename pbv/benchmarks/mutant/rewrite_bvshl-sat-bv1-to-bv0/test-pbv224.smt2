(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvshl s s) (_ bv0 k)) (= (_ bv0 k) (bvshl s s))))
(check-sat)
(exit)