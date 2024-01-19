(defun f(l)
  (cond
    ((null l) 0)
    ((> (f (car l)) 2) (+ (car l) (f (cdr l))))
    (t(f(car l)))
  )
)

(defun f2(l)
  (cond
    ((null l) 0)
    (t ((lambda (x)
	  (cond
	  	((> x 2) (+ (car l) (f2 (cdr l))))
	  	(t x)
	  ))(f2 (car l))
	)
       )
    )
)

(defun f3(l)
  (funcall #'(lambda (temp)
	       (cond
		 ((null l) 0)
		 ((> temp 2) (+ (car l) (f3(cdr l))))
		 (t temp)
		)
	       )
	   (f3 (car l))
	  ))

