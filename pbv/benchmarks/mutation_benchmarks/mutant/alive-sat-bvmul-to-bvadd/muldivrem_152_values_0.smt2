(set-logic ALL)
(declare-const k Int)
(declare-fun %x () (_ BitVec k))
(assert (not (= (bvadd %x (bvnot (_ bv0 k))) (bvsub (_ bv0 k) %x))))
(check-sat)