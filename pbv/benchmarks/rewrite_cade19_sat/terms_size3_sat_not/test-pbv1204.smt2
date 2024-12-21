(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvadd s s) (bvand s t)) (bvand s (bvand t (bvadd s s))))))
(check-sat)
(exit)