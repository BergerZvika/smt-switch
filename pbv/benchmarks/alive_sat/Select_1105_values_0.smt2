(set-logic ALL)
(declare-const k Int)
(declare-fun %Y () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (not (not (= %Y %Y))))
(check-sat)