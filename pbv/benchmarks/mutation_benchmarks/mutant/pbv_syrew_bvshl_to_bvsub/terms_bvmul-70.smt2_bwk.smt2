(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvmul t (bvlshr (_ bv1 k) t))) s))
(check-sat)
