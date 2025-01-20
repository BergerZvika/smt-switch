(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvurem (_ bv0 k) t)) (_ bv0 k)))
(check-sat)
