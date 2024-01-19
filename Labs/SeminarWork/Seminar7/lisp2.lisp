;Remove all elems which are multiple of n from a nonlinear list using map functions.
;ex. : n = 4 (1 3 4(8 (10 40)) 36(1 (7 5)) 44) => (1 3 ((10)) (1 (7 5)))

;removeMultiples(lst, n)=
;(lst) , if lst non-numerical Atom || (lst is number && lst % n != 0)
;nil , if lst is number && lst % n == 0
;append(i = 1..n)(removeMultiples(lst, n)) , otherwise lst = lst1,..,lstn


(defun removeMultiples(lst, n)
  (cond
    ((and (atom lst (not (numberp lst)))) list car)
    ((and(numberp(lst))(= (mod lst n)0)) nil)
    (t (list apply #'append(mapcan #'(lambda(elem) (removeMultiples elem n))lst)))
  )
)
