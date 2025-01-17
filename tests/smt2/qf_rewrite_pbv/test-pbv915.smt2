(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvudiv s (bvnot (bvneg s)))) (= s (bvneg (bvnot (bvudiv s s))))))
(check-sat)
(exit)