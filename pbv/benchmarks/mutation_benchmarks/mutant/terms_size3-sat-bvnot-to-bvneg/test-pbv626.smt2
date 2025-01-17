(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvneg (_ bv0 k)) s)) (bvlshr s (bvshl s s))))
(check-sat)
(exit)