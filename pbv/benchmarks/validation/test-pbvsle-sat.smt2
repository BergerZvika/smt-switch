(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec k))
(assert (bvsle x y))
(assert (bvsle y x))
(assert (= y x))
(check-sat)
(exit)
