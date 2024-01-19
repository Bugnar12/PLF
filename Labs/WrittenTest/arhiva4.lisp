(defun replaceEven(l)
  (cond
    ((and (numberp l)(evenp l)(+ l 1)))
    ((atom l) l)
    (t (mapcar #'replaceEven l))
  )
)
