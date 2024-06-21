(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvlshr s (bvadd s s))) (bvand s (bvshl s (bvadd s s))))))
(check-sat)
(exit)