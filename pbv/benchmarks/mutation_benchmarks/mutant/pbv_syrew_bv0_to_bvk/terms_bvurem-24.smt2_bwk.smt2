(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem (bvnot (_ bvk k)) s) (bvurem (bvnot s) s)))
(check-sat)
