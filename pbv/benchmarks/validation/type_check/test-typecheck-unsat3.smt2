(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const m Int)
(declare-const r Int)
(declare-const x (_ BitVec k))
(declare-const y (_ BitVec k))
(declare-const z (_ BitVec m))
(declare-const w (_ BitVec r))
(declare-const t (_ BitVec k))
(assert (= (concat w (concat x y)) z))
(assert (= (concat ((_ extract 0 0) t) ((_ extract 1 1) t)) z))
(check-sat)
(exit)