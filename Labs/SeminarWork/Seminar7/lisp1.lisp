;Compute the depth of a tree denoted (node (subtree1) (subtree2) ....() ) using MAP functions

;depth(root, l1,..,ln)=
;=0 , if root = null && n = 0
;=1 , if n = 0 && root is atom
;=1 + max (i = (1,..,n) depth(li)) , otherwise

(defun depth (tree)
  (cond
    ((null tree) 0)
    ((atom tree) 1)
    (t (+ 1 (apply #'max (mapcar #'depth (cdr tree)))))
  )
)
