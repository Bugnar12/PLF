;(mapcar #'triple '(1 2 3 4)) = (list (triple 1) (triple 2) (triple 3) (triple 4))
;(apply '+ (mapcar #'triple '(1 2 3))) => (apply '+ (3 6 9)) => 3 + 6 + 9 = 18
;triple(x)=
;3x , if x-number
;x , x - non-numerical atom
;U(1,..,n)triple(xi) , if x = x1,..,xn (a list)


