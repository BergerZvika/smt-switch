(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvadd s (bvadd s (_ bv0 k)))) (bvule s (bvadd s s))))
(check-sat)
(exit)