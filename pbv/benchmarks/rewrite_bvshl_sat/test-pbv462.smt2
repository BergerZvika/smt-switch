(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= t (bvsub (_ bv0 k) (bvadd t (_ bv1 k)))) (distinct s s))))
(check-sat)
(exit)