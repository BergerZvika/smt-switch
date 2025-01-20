(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand t (bvshl s (bvshl s (bvnot s)))) (bvand s (bvshl t (bvshl s (bvnot s)))))))
(check-sat)
(exit)