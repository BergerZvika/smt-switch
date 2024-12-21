(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (or (not (= %A (_ bv0 k))) (not (= %B (_ bv0 k)))) (not (= (bvor %A %B) (_ bv0 k))))))
(check-sat)