(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(assert (not (= (or (= %B (_ bv1 k)) (bvult %A %B)) (bvuge (bvadd %B (bvnot (_ bv0 k))) %A))))
(check-sat)