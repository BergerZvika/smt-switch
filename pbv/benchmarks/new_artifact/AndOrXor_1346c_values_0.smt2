(set-logic ALL)
(declare-const k Int)
(declare-fun %y () (_ BitVec 4))
(declare-fun %x () (_ BitVec 4))
(assert (not (= (bvand ((_ extract 0 0) %x) ((_ extract 0 0) %y)) ((_ extract 0 0) (bvand %x %y)))))
(check-sat)