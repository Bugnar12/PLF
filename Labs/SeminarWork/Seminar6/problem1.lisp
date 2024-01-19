;Two collector variable approach ~ other possibility with 3 functions
;---CHECK IF IT IS A NUMBER!!!---
;when using append, the parameters should be 2 lists and we ADD AT THE END
;when using cons, one param. - integer, one param. - list, we ADD AT THE BEGINNING

;minPos(l1,..,ln , minC, posC, index)=
;=posC , if n = 0
;=minPos(l2,..,ln , minC, posC, index + 1) , if l1 is not a number
;=minPos(l2,..,ln, l1, (index), index + 1) , if l1 number and minC not number
;=minPos(l2,..,ln, minC, posC, index + 1) , if l1 > minC
;=minPos(l2,..,ln, minC, posC U index, index + 1) , if l1 = minC
;=minPos(l2,..,ln, l1, [index], index + 1) , if l1 < minC

;main(l1,..,ln) = min Pos(l1,..,ln, l1, [], 1)

(defun minPos(l minC posC index)
  (cond
    ((l null) NIL) ;we don't return posC because it will be initialized in the main call
    ((not(NumberP(car l) (minPos(cdr l) minC posC (+ index 1)))))
    ((and (NumberP minC) (>(car l) minC) (minPos(cdr l) minC posC (+ index 1))))
    ((and (NumberP minC) (=(car l) minC) (minPos(cdr l) minC (append posC (list index)) (+ index 1))))
    (T (minPos (cdr l) (car l) (list index) (+index 1)))
  )
)

(defun main(l)
  (minPos l (car l) NIL 1)
)

