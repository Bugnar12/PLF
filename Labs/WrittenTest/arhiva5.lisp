(defun checkNumeric(l)
  (cond
    ((null l) nil)
    ((and(not(numberp (car l))) (null (cdr l))) T)
    (T(checkNumeric(cdr l)))
  )
)

(defun wrapper(l)
  (cond
    ((atom l) 0)
    ((and (listp l) (not (checkNumeric l))) (apply #'+(mapcar #'wrapper l)))
    (t (+ 1 (apply #'+(mapcar #'wrapper l))))
  )
)
