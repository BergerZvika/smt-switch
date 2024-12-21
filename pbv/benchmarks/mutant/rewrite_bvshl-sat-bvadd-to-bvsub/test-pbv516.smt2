(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvsub s (bvsub s t))) (= t (bvadd s s))))
(check-sat)
(exit)