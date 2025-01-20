(set-logic ALL)
(declare-const k Int)
(declare-fun %C () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (bvxor %A %B))) (not (= (bvand _let_0 (bvxor (bvxor %B %C) %A)) (bvand _let_0 (bvxor %C (bvnot (_ bv0 k))))))))
(check-sat)