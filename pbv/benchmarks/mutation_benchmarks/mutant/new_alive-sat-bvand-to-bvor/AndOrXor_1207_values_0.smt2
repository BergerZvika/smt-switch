(set-logic ALL)
(declare-const k Int)
(declare-const m Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun C1 () (_ BitVec m))
(declare-fun %x () (_ BitVec m))
(assert (> m k))
(assert (not (= (bvor (pextract (- k 1) 0 (bvand %x C1)) C2) (bvand (pextract (- k 1) 0 %x) (bvand (pextract (- k 1) 0 C1) C2)))))
(check-sat)