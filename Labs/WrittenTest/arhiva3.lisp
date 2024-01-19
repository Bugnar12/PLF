(defun f(x &rest y)
  (cond
    ((null y) x)
    (t (append x(mapcar #'car y)))
  )
)
