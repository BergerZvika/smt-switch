(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(declare-fun %B () (_ BitVec k))
(assert (not (not (= (or (= %B (_ bv0 k)) (bvugt %B %A)) (bvuge (bvadd %B (bvnot (_ bv0 k))) %A)))))
(check-sat)