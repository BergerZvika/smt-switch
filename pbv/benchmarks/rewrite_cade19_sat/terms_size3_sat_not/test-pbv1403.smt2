(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvshl s (bvneg t)) t) (bvlshr s (bvor t (bvneg t))))))
(check-sat)
(exit)