(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvlshr s (bvshl t s))) (bvurem s (bvshl s (bvshl t s))))))
(check-sat)
