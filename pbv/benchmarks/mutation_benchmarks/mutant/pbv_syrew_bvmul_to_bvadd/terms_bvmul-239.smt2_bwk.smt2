(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (bvadd s s) (bvshl (_ bv1 k) s)) (bvshl (bvlshr s (_ bv1 k)) s)))
(check-sat)