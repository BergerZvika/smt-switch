(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvxor %A (_ bv15 k)) (bvxor %B (_ bv15 k))) (bvxor (bvand %A %B) (_ bv15 k)))))
(check-sat)