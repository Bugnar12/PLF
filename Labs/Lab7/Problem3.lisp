;3. Define a function to tests the membership of a node in a n-tree represented as (root 
;list_of_nodes_subtree1 ... list_of_nodes_subtreen) 
;Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true



;checkElement(l-list, elem-number)=
;=true , if l = elem
;=false, if l != elem
;=checkElement(l1, elem) OR checkElement(l2, elem) OR checkElement(l3, elem)...checkElement(ln, elem) , otherwise;l-list

(defun checkElement(l elem)
  (cond
    ((and(atom l) (equal l elem)) t)
    ((atom l) nil)
    (t ( some #'identity (mapcar #'(lambda (a) (checkElement a elem)) l)))
  )
)
