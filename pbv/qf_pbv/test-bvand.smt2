(set-logic ALL)
(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 8))
(declare-const z (_ BitVec 8))
(assert (distinct x 0))
(assert (distinct y 0))
(assert (= z 0))
(assert (= z (bvand x y)))
(check-sat)
(exit)