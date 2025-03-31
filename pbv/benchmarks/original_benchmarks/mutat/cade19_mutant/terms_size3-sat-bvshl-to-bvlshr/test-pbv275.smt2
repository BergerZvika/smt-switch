(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr s (bvnot s))) (bvshl s (bvnot s))))
(check-sat)
(exit)