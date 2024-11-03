(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand t (bvand s (bvadd s t))) (bvand s (bvand t (bvadd s t))))))
(check-sat)
(exit)