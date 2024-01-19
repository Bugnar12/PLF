(defun myReplace(l level e)
  (cond
    ((and (oddp level) (atom l)) e)
    ((atom l) l)
    (t (mapcar #'(lambda(x) (myReplace x (+ level 1) e)) l))
  )
)

(defun main(l e)
  (myReplace l 1 e)
)
