(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(assert (not (= (or (= %B (_ bv0 k)) (bvult %A %B)) (bvuge (bvadd %B (_ bv15 k)) %A))))
(check-sat)