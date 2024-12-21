(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const t (_ BitVec k))
(assert (= (concat ((_ extract 1 0) t) ((_ extract 2 1) t)) (concat ((_ extract 2 1) t) ((_ extract 1 0) t))))
(check-sat)
(exit)