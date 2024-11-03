(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct t (bvsub s (bvlshr s t))) (distinct s (bvadd t (bvshl s t)))))
(check-sat)
(exit)