(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem (bvlshr s (_ bv1 k)) s) (bvlshr s (_ bv1 k)))))
(check-sat)
