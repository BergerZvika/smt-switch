(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvadd s (bvor s (_ bv0 k)))) (bvand s (bvadd s s))))
(check-sat)
(exit)