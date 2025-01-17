(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvneg (bvand s t))) (bvand s (bvneg t))))
(check-sat)
(exit)