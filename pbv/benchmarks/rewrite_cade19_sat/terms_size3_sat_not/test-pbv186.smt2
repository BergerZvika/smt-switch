(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvneg (bvor s (bvneg s))) (bvand s (bvneg s)))))
(check-sat)
(exit)