(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvmul (bvshl t s) t)) (bvshl s (bvmul t (bvshl t s)))))
(check-sat)
(exit)