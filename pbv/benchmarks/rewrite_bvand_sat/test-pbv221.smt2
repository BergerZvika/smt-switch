(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (_ bv1 k) (bvadd s (bvadd t t))) (bvadd t (bvadd t (bvor s (_ bv1 k)))))))
(check-sat)
(exit)