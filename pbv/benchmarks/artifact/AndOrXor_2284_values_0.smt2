(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor %A (bvxor (bvor %A %B) (_ bv15 k))) (bvor %A (bvxor %B (_ bv15 k))))))
(check-sat)