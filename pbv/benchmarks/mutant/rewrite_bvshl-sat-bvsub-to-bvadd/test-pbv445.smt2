(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule t (bvadd t (bvsub s t))) (bvule t (bvsub s (bvadd t (_ bv1 k))))))
(check-sat)
(exit)