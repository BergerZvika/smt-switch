(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvurem (bvnot (_ bv0 k)) t)) (bvlshr s (bvurem (bvnot t) t))))
(check-sat)
