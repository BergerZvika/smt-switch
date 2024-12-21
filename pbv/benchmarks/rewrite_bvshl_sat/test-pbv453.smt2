(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= t (bvsub (_ bv0 k) (bvadd s s))) (= s (bvsub (_ bv0 k) (bvadd s t))))))
(check-sat)
(exit)