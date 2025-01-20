(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (_ bv1 k) (bvshl (bvnot s) (_ bv1 k))) (bvand (_ bv1 k) (bvlshr s (bvadd s s)))))
(check-sat)
