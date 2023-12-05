;a) Write a function to return the n-th element of a list, or NIL if such an element does not exist
;n-thElement(l1,..,ln , elem, pos)=
;=NIL , if n = 0
;=l1 , if pos = ni
;=n-thElement(l2,..,ln, n, pos+1) , otherwise

(defun n-thElement(l n pos)
  (cond
    ((null l) nil)
    ((= n pos) (car l))
    (t (n-thElement (cdr l) n (+ pos 1)))
  )
)

(defun main(l n)
  (n-thElement l n 0)
)

;b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.
;checkIfAtom(l1,..,ln , elem)=
;= nil , if n = 0
;= true , if l1 is an atom and l1 = elem
;= checkIfAtom(l1, elem) U checkIfAtom(l2,..,ln , elem) , if l1 is a list
;= checkIfAtom(l2,..,ln , elem) , otherwise

(defun checkIfAtom(l elem)
  (cond
    ((null l) nil)
    ((and (atom (car l)) (equal (car l) elem)) t)
    ((listp (car l)) (or (checkIfAtom (car l) elem) (checkIfAtom (cdr l) elem)))
    (t (checkIfAtom (cdr l) elem))
  )
)

; c) Write a function to determine the list of all sublists of a given list, on any level.
; A sublist is either the list itself, or any element that is a list, at any level. Example:
; (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
; ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )

;sublists(l1l2...ln) = { NIL, if n = 0 or l1 is an atom
;                       { append(l1) U sublists(l2...ln), otherwise

(defun sublists (l)
   (cond
     ((null l) NIL)
     ((atom (car l)) (sublists (cdr l)))
     (T (append (list (car l)) (append (sublists (car l)) (sublists (cdr l)))))
   )
)

;Idea : construct a list that includes the original list and all the sublists of its elements 

;allSublists(l1,..,ln)=
;=NIL , if l is atom
;=l1 U l2,..,ln , otherwise 

(defun allSublists (l)
  (cond
    ((atom l) nil)
    (T (apply 'append (list l) (mapcar 'allSublists l)))
  )
)

; d) Write a function to transform a linear list into a set.

; removeElement(l1l2...ln, e) =
;=NIL , if n = 0
;=removeElement(l2...ln, e) , if l1 = e
;={l1} U removeElement(l2...ln, e) , otherwise


(defun removeElement (l e)
    (cond
        ((null l) NIL)
        ((equal (car l) e) (removeElement (cdr l) e))
        (t (cons (car l) (removeElement (cdr l) e)))
    )
)

; listToSet(l1l2...ln)=
;=NIL , if n = 0
;={l1} U listToSet(removeElement(l2...ln, l1)), otherwise
;~Remove the duplicates

(defun listToSet (l)
    (cond
        ((null l) NIL)
        (t (cons (car l) (listToSet (removeElement (cdr l) (car l)))))
    )
)


