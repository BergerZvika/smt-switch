(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvnot (bvmul s s))) (bvand (_ bv1 k) (bvnot s))))
(check-sat)
