(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvnot (bvsub s s))) (distinct s (bvadd s (bvnot t)))))
(check-sat)
(exit)