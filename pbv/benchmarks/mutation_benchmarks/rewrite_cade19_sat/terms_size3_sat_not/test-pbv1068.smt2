(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvadd s (bvadd t t))) (bvadd s (bvadd t (bvadd t t))))))
(check-sat)
(exit)