(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvnot (bvadd s s))) (= s (bvnot (bvadd s t)))))
(check-sat)
(exit)