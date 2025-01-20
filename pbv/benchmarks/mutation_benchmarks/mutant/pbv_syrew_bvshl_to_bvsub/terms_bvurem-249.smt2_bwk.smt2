(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (bvsub s s) s)) (bvlshr s (bvshl s s))))
(check-sat)