(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl t (bvnot t))) (bvlshr s (bvshl t (bvneg t)))))
(check-sat)
(exit)