(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvnot (bvsub t (bvadd s s)))) (= t (bvnot (bvneg s)))))
(check-sat)
(exit)