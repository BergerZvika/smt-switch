(set-logic ALL)
(declare-const k Int)
(declare-fun %x () (_ BitVec k))
(declare-fun C () (_ BitVec k))
(assert (not (= (bvadd (bvxor %x (bvnot (_ bv0 k))) C) (bvsub (bvsub C (_ bv0 k)) %x))))
(check-sat)