(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr (bvsub s s) s) t) (bvlshr (bvadd s (bvlshr s t)) s)))
(check-sat)
(exit)