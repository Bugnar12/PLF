;Check if e is an element of a non-linear list
;find(l, e)=
;=0 , e != l1
;=1 , e = l1
;sum(1,..,n) find(li, p) , if l is a list

(defun find (l e)
  (cond
    ((and (atom l) (= l e) 1))
    ((atom l) 0)
    (t (apply '+ ((mapcar #'(lambda(x) (find x e)) l))))
  )
)

