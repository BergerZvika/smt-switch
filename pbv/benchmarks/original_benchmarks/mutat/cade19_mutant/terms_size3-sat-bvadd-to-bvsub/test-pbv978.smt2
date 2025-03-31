(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvor (bvand t (int_to_pbv k 0)) s)) (bvadd s s)))
(check-sat)
(exit)