(set-logic ALL)
(declare-const k Int)
(declare-fun %Y () (_ BitVec 11))
(declare-fun C1 () (_ BitVec 4))
(declare-fun C2 () (_ BitVec 11))
(declare-fun %X () (_ BitVec 4))
(assert (let ((_let_0 (bvand %X C1))) (let ((_let_1 (not (= ((_ extract 10 6) C2) (_ bv0 5))))) (let ((_let_2 (not (= ((_ extract 10 9) C2) (_ bv0 2))))) (let ((_let_3 (not (= ((_ extract 10 10) C2) (_ bv0 1))))) (let ((_let_4 (not (= ((_ extract 8 8) C2) (_ bv0 1))))) (let ((_let_5 (not (= ((_ extract 7 7) C2) (_ bv0 1))))) (let ((_let_6 (not (= ((_ extract 5 3) C2) (_ bv0 3))))) (let ((_let_7 (not (= ((_ extract 5 5) C2) (_ bv0 1))))) (let ((_let_8 (not (= ((_ extract 4 4) C2) (_ bv0 1))))) (let ((_let_9 (not (= ((_ extract 2 2) C2) (_ bv0 1))))) (let ((_let_10 (not (= ((_ extract 1 1) C2) (_ bv0 1))))) (let ((_let_11 (not (= ((_ extract 3 2) C1) (_ bv0 2))))) (let ((_let_12 (not (= ((_ extract 3 3) C1) (_ bv0 1))))) (let ((_let_13 (not (= ((_ extract 1 1) C1) (_ bv0 1))))) (and (bvsge (ite _let_1 (ite _let_2 (ite _let_3 (_ bv10 32) (_ bv9 32)) (ite _let_4 (_ bv8 32) (ite _let_5 (_ bv7 32) (_ bv6 32)))) (ite _let_6 (ite _let_7 (_ bv5 32) (ite _let_8 (_ bv4 32) (_ bv3 32))) (ite _let_9 (_ bv2 32) (ite _let_10 (_ bv1 32) (_ bv0 32))))) (ite _let_11 (ite _let_12 (_ bv3 32) (_ bv2 32)) (ite _let_13 (_ bv1 32) (_ bv0 32)))) (= (bvand C1 (bvsub C1 (_ bv1 4))) (_ bv0 4)) (= (bvand C2 (bvsub C2 (_ bv1 11))) (_ bv0 11)) (not (= (ite (= _let_0 (_ bv0 4)) %Y (bvor %Y C2)) (bvor (bvshl ((_ zero_extend 7) _let_0) (bvsub (ite _let_1 (ite _let_2 (ite _let_3 (_ bv10 11) (_ bv9 11)) (ite _let_4 (_ bv8 11) (ite _let_5 (_ bv7 11) (_ bv6 11)))) (ite _let_6 (ite _let_7 (_ bv5 11) (ite _let_8 (_ bv4 11) (_ bv3 11))) (ite _let_9 (_ bv2 11) (ite _let_10 (_ bv1 11) (_ bv0 11))))) (ite _let_11 (ite _let_12 (_ bv3 11) (_ bv2 11)) (ite _let_13 (_ bv1 11) (_ bv0 11))))) %Y))) (not (= C1 (_ bv0 4))) (not (= C2 (_ bv0 11)))))))))))))))))))
(check-sat)