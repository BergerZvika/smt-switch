(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvlshr (bvnot (_ bv0 k)) t)) (bvurem s (bvlshr (bvnot t) t)))))
(check-sat)
