(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvadd s t) (_ bv1 k)) (= t (bvadd (_ bv0 k) s))))
(check-sat)
(exit)