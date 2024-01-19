;Remove all occurences of an element form a non-linear list
;removeOcc(l1,..,ln , elem)=
; = l1 U removeOcc(l2,..,ln, elem) , if atom(l1) and l1 != elem
; = removeOcc(l1, elem) U removeOcc(l2,..ln, elem), if !atom(l1)
; = removeOcc(l2,..,ln , elem) , otherwise


(defun removeOcc(l elem)
  (cond
    ((null l) NIL)
    ((and (atom (car l)) (= (car l) elem)) (cons (car l) (removeOcc (cdr l) elem)))
    ((atom (car l)) (removeOcc (cdr l) elem))
    (T (cons (removeOcc(car l) elem) (removeOcc(cdr l) elem)))
  )
)


