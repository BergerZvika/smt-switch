(set-logic ALL)
(declare-const k Int)
(declare-fun %x () (_ BitVec k))
(assert (not (= (bvmul %x (bvnot (_ bv0 k))) (bvsub (_ bv0 k) %x))))
(check-sat)


./cmpr.py ./wd1/rewrite_bvshl ./wd1/bvsub_bvshl --show-uniq
./cmpr.py ./wd1/rewrite_bvshl ./wd1/bvsub_bvshl --show-diff