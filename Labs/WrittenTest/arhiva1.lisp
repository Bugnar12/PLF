(defun myRemove(l)
  (cond
    ((and (numberp l) (= (mod l 3) 0)) NIL)
    ((atom l) (list l))
    (t (list(mapcan #'myRemove l))) ;if list is not present, then the non-lin. list will be linearized
    				    ;tl;dr => we must 'concatenate' all the lists, not just the atoms
  )
)

(defun main(l)
  (car (myRemove l))
)
