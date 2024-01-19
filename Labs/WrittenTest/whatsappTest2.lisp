(defun replace0(l level k)
  (cond
    ((and(= level k) (atom l)) 0)
    ((atom l) l)
    (t(mapcar #' (lambda (x) (replace0 x (+ level 1) k)) l))
  )
)

(defun main(l k)
  (replace0 l 0 k)
)
