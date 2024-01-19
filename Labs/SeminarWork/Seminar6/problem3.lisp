;Compute the product of all numerical elements in a non-linear list
;product(x)=
;=x , if x is a number
;=1 , if x is a non-numerical atom
;=product(1,n) (xi) , if x is a list


(defun product(x)
  (cond
    ((NumberP x) x)
    ((Atom x) 1)
    (t (apply '*(mapcar #'product x)))
  )
)
