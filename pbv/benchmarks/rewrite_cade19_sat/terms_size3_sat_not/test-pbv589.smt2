(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvor (bvneg t) t)) (bvand s (bvor t (bvneg t))))))
(check-sat)
(exit)