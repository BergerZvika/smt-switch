(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvnot (bvurem (bvnot s) (_ bvk k))) s))
(check-sat)