(set-logic ALL)
(declare-const k Int)
(declare-fun %X () (_ BitVec k))
(declare-fun %Y () (_ BitVec k))
(assert (not (= %X %X)))
(check-sat)