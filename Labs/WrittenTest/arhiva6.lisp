(defun myMax(l e)
  (cond
    ((null l) e)
    ((> (car l) e) (myMax (cdr l) (car l)))
    (t (myMax (cdr l) e))
  )
)

(defun getNrOddLevel(l level)
  (cond
    ((and (numberp l) (= 1 (mod level 2))) (list l))
    ((atom l) nil)
    (t (apply #'append(mapcar #'(lambda (a) (getNrOddLevel a (+ level 1)))l)))
  )
)

(defun check (l level)
  (cond
    ((oddp(myMax(getNrOddLevel l level) -1)) nil)
    (t t)
  )
)

(defun countSubLists(l level)
  (cond
    ((atom l) 0)
    ((and (listp l) (check l level)) (+ 1(apply #'+(mapcar #'(lambda (x) (countSubLists x (+ 1 level))) l))))
    (t (apply #'+(mapcar #'(lambda(x) (countSubLists x (+ 1 level))) l)))
  )
)

(defun main(l)
  (countSubLists l 0)
)
