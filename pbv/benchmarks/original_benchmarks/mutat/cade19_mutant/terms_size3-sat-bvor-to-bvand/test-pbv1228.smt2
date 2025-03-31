(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s s) (bvlshr s t)) (bvadd (bvshl s s) (bvlshr s t))))
(check-sat)
(exit)