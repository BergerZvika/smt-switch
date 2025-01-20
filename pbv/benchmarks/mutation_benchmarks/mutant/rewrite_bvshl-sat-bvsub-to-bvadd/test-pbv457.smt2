(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvadd (_ bv0 k) (bvadd s (_ bv1 k)))) (distinct s (bvsub (_ bv0 k) (bvadd t (_ bv1 k))))))
(check-sat)
(exit)