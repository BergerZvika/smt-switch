(set-logic UFNIA)
(declare-fun bvand (Int Int Int) Int)
(declare-const k Int)
(declare-const _pbv_C1 Int)
(declare-const _pbv_%Z Int)
(declare-const _pbv_%RHS Int)
(declare-const _pbv_C2 Int)
(assert (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= _pbv_C2 (- (^ 2 k) (+ _pbv_C1 1))) (not (= (mod (+ (+ (- (- (+ (- (+ _pbv_%Z _pbv_C2) (bvand k _pbv_%Z _pbv_C2)) _pbv_C1) (bvand k (- (+ _pbv_%Z _pbv_C2) (bvand k _pbv_%Z _pbv_C2)) _pbv_C1)) (bvand k (- (+ _pbv_%Z _pbv_C2) (bvand k _pbv_%Z _pbv_C2)) _pbv_C1)) 1) _pbv_%RHS) (^ 2 k)) (mod (- _pbv_%RHS (bvand k _pbv_%Z _pbv_C1)) (^ 2 k))))) (>= _pbv_C1 0)) (< _pbv_C1 (^ 2 k))) (>= _pbv_%Z 0)) (< _pbv_%Z (^ 2 k))) (forall ((x Int)) (forall ((y Int)) (=> (and (>= x 0) (>= y 0) (<= x 1) (<= y 1)) (= (bvand 1 x y) (ite (> (mod y 2) (mod x 2)) (mod x 2) (mod y 2))))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x (- (^ 2 k) 1)) x))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x 0) 0))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x x) x))))) (forall ((k Int)) (forall ((x Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k))) (= (bvand k x (- (^ 2 k) (+ x 1))) 0))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (= (bvand k x y) (bvand k y x))))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (forall ((z Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k)) (>= z 0) (< z (^ 2 k))) (=> (distinct x y) (or (distinct (bvand k x z) y) (distinct (bvand k y z) x))))))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (>= (bvand k x y) 0)))))) (forall ((k Int)) (forall ((x Int)) (forall ((y Int)) (=> (and (> k 0) (>= x 0) (< x (^ 2 k)) (>= y 0) (< y (^ 2 k))) (>= (ite (> x y) y x) (bvand k x y))))))) (>= _pbv_%RHS 0)) (< _pbv_%RHS (^ 2 k))) (>= _pbv_C2 0)) (< _pbv_C2 (^ 2 k))) (and (> k 0) (= k k))))
(check-sat)
