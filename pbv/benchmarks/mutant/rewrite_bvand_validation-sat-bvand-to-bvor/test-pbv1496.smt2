(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvlshr s s) (bvshl t s)) (bvor (bvnot s) (bvshl t s))))
(check-sat)
(exit)