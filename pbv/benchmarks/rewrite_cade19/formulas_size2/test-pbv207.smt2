(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (_ bv0 k) (bvadd t s)) (bvslt (_ bv0 k) (bvadd s t))))
(check-sat)
(exit)