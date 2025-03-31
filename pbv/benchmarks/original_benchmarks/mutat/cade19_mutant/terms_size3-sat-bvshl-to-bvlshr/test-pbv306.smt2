(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr s (bvshl t s))) (bvlshr s (bvshl t s))))
(check-sat)
(exit)