(set-logic ALL)
(declare-const k Int)
(declare-fun %C () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(assert (not (not (= (bvor (bvand (bvor %B %C) %A) %B) (bvor %B (bvand %A %C))))))
(check-sat)