(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvadd s (bvnot t))) (distinct s (bvnot (bvsub t s)))))
(check-sat)
(exit)