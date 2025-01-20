(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvurem (_ bv1 k) (bvadd t (_ bv1 k)))) (bvlshr s (bvand (_ bv1 k) (bvnot t)))))
(check-sat)
