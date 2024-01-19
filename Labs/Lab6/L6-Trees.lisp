; 9. Convert a tree of type (1) to type (2).
; Tree of type (1) : (A 2 B 0 C 2 D 0 E 0)
; Tree of type (2) : (A (B) (C (D) (E)))

;left_traversal(l1,..,ln, nrNodes, nrEdges)=
;=NIL , if n = 0
;=NIL , if nrNodes = nrEdges + 1
;={l1} U {l2} U left_traversal(l3, nrNodes + 1, l2 + nrEdges) , otherwise

(defun left_traversal(l nrNodes nrEdges)
  (cond
    ((null l) NIL)
    ((= nrNodes (+ 1 nrEdges)) NIL)
    (T (cons (car l) (cons (cadr l) (left_traversal (cddr l) (+ 1 nrNodes) (+ (cadr l) nrEdges)))))
  )
)

;right_traversal(l1,..,ln, nrNodes, nrEdges)=
;=NIL , if n = 0
;=l1,..,ln , if nrNodes = nrEdges + 1
;=right_traversal(l3,..,ln, nrNodes + 1, nrEdges + l2) , otherwise

(defun right_traversal(l nrNodes nrEdges)
  (cond
    ((null l) NIL)
    ((= (+ nrEdges 1) nrNodes) l)
    (t (right_traversal (cddr l) (+ nrNodes 1) (+ (cadr l) nrEdges)))
  )
)

;left(l1,..,ln)=
;=left_traversal(l3, 0, 0)
(defun left (l)
  (left_traversal (cddr l) 0 0)
)

;right(l1,..,ln)
;=right_traversal(l3, 0, 0)
(defun right (l)
  (right_traversal (cddr l) 0 0)
)

;appending(l1,..,ln , k1,..,km)=
;= k1,..,km , if n = 0
;= {l1} U appending(l2,..,ln , k1,..,km)

(defun appending (l k)
  (cond
    ((null l) k)
    (t (cons (car l) (appending (cdr l) k)))
  )
)

;converter(l1,..,ln)=
;=nil , if n = 0
;=appending(list(l1), converter(left(l1,..,ln)) U list(converter(right(l1,..ln)))) , if l2 = 2
;=appending(list(l1), list(converter(left(l1,..,ln)))) , if l2 = 1
;=list(l1) , if l2=0

(defun converter(l)
  (cond
    ((null l) NIL)
    ((equal (cadr l) 2) (appending(list (car l)) (cons (converter (left l)) (list(converter (right l))))))
    ((equal (cadr l) 1) (appending(list (car l)) (list (converter (left l)))))
    (t (list (car l)))
  )
)
