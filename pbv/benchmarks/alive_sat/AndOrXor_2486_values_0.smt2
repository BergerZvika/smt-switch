(set-logic ALL)
(declare-const k Int)
(declare-fun %x () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(assert (not (not (= (bvxor (bvadd %x C) (bvnot (_ bv0 k))) (bvsub (bvsub (bvnot (_ bv0 k)) C) %x)))))
(check-sat)