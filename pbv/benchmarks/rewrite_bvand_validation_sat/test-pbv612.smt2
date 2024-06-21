(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl t (bvnot (bvand s t)))) (bvshl t (bvnot (bvand s t))))))
(check-sat)
(exit)