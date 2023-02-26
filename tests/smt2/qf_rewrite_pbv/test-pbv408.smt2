(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvadd s s) (bvnot t)) (bvule t (bvnot (bvadd s s)))))
(check-sat)
(exit)