(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvudiv s (bvnot (bvudiv t s)))) (= s (bvadd s (bvnot (bvudiv t s))))))
(check-sat)
(exit)