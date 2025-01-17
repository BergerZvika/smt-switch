(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvor t (bvnot t)) t) (bvshl (bvnot (bvlshr s s)) t))))
(check-sat)
(exit)