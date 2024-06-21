(set-logic ALL)
(declare-const k Int)
(declare-fun C () (_ BitVec k))
(declare-fun %x () (_ BitVec k))
(assert (not (not (= (bvxor (bvsub C %x) (bvnot (_ bv0 k))) (bvadd %x (bvsub (bvnot (_ bv0 k)) C))))))
(check-sat)