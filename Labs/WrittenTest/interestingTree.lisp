(defun checkTF(l)
  (cond
    ((equalp(car l) t) t)
    ((listp(car l)) (or(checkTF(car l)) (checkTF(cdr l))))
    (t (checkTF(cdr l)))
  )
)

(defun checkLists(l node level)
  (cond
    ((and (and (equalp(mod level 2) 0)(atom l)) (equalp l node)) (list T))
    ((atom l) (list nil))
    (t (apply #'checkTF(list(mapcar #' (lambda (x) (checkLists x node (+ level 1))) l))))
  )
)

(defun main(l node)
  (checkLists l node -1)
)

;Fill the list with T and F but every such element should be PUT IN THE LIST
;afterwards, check the list and if the element is equal to t => return true

