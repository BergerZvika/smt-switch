(set-logic ALL)
(declare-const k Int)
(declare-fun %y () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (not (= (not (bvslt %x %y)) (bvsge %x %y))))
(check-sat)