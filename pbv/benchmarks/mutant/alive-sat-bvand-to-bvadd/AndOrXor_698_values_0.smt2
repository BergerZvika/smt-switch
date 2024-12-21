(set-logic ALL)
(declare-const k Int)
(declare-fun %d () (_ BitVec k))
(declare-fun %b () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(assert (not (= (and (= (bvadd %a %b) (_ bv0 k)) (= (bvand %a %d) (_ bv0 k))) (= (bvand %a (bvor %b %d)) (_ bv0 k)))))
(check-sat)