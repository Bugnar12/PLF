(defun computeSum (l)
  (cond
    ((null l) 0)
    ((listp (car l)) (+ (computeSum (car l)) (computeSum (cdr l))))
    (t (+ (car l) (computeSum (cdr l))))
  )
)

(defun nrNodes(l k level)
  (cond
    ((and (atom l) (eq k level)) 1)
    ((atom l) 0)
    (t (apply #'computeSum (list (mapcar #' (lambda (a) (nrNodes a k (+ 1 level))) l))))
  )
)

(defun main(l k)
  (nrNodes l k -1)
)
