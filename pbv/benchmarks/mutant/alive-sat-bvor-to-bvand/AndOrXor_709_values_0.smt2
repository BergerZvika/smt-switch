(set-logic ALL)
(declare-const k Int)
(declare-fun %d () (_ BitVec k))
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (let ((_let_0 (bvand %b %d))) (not (= (and (= (bvand %a %b) %b) (= (bvand %a %d) %d)) (= (bvand %a _let_0) _let_0)))))
(check-sat)