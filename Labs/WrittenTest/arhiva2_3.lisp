(defun myReplace(l e level)
  (cond
    ((and (atom l) (oddp level))e)
    ((atom l) l)
    (t(mapcar #'(lambda(x) (myReplace x e (+ level 1)))l))
  )
)

(defun main(l e)
  (myReplace l e -1)
)
