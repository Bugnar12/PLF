(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

(defun inordine (arb)
(cond
((null arb) nil)
(t (myAppend (inordine (cadr arb)) (myAppend(list (car arb)) (inordine (caddr arb)))))
)
)

