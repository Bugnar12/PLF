;27.Write a function to delete the 1st, 2nd, 4th, 8th element of a linear list.
;Example : (sterg '(1 2 3 4 5 6)) ->(3 5 6)

;removeElement(l pos power)
;nil, if n = 0
;removeElement(l2,..,ln , pos+1, power*2) , if pos = power 
;{l1} U removeElement(l2,..,ln, pos+1, power) , otherwise

;Description : delete only the elements of which position = 2^n
;Parse the list recursively and if pos = power => remove elem. AND power * 2 AND pos+1
;				if pos != power => NOT remove, power remains the same and pos+1
;We increase the position in any case since we parse the list
;But the power only when we encounter an element that needs deletion

(defun removeElement(l pos power)
  (cond
    ((null l) nil)
    ((= pos power) (removeElement(cdr l) (+ 1 pos) (* power 2)))
    (t (cons(car l) (removeElement(cdr l) (+ 1 pos) power)))
  )
)


(defun wrapper(l)
  (removeElement l 1 1)
)

