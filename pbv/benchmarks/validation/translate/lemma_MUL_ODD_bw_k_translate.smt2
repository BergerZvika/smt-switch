(set-logic UFNIA)
(declare-fun bvand (Int Int Int) Int)
(declare-const k Int)
(declare-const _pbv_x Int)
(declare-const _pbv_s Int)
(declare-const _pbv_t Int)
(assert (and (and (and (and (and (and (and (= _pbv_t (mod (* _pbv_x _pbv_s) (^ 2 k))) (>= _pbv_s 0)) (< _pbv_s (^ 2 k))) (>= _pbv_x 0)) (< _pbv_x (^ 2 k))) (>= _pbv_t 0)) (< _pbv_t (^ 2 k))) (and (> k 0) (= k k))))
(assert (and (and (and (and (and (and (and (and (and (and (not (= (mod _pbv_t 2) (bvand 1 (mod _pbv_x 2) (mod _pbv_s 2)))) (forall ((x Int)) (forall ((y Int)) (=> (and (>= x 0) (>= y 0) (<= x 1) (<= y 1)) (= (bvand 1 x y) (ite (> (mod y 2) (mod x 2)) (mod x 2) (mod y 2))))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x (- (^ 2 k) 1)) x))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x 0) 0))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x x) x))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x (- (^ 2 k) (+ x 1))) 0))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (= (bvand k x y) (bvand k y x))))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (forall ((z Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k)) (>= z 0) (< z (^ 2 k))) (=> (distinct x y) (or (distinct (bvand k x z) y) (distinct (bvand k y z) x))))))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (>= (bvand k x y) 0)))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (>= (ite (> x y) y x) (bvand k x y))))))) (and (= 1 1) (> 1 0))))
(assert (>= k 4))
(check-sat)
