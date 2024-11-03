(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvadd t (bvneg (_ bv0 k)))) (bvand s (bvnot (bvneg t)))))
(check-sat)
(exit)