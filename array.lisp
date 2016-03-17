(defun println (obj)
	(write obj)
	(write-line ""))

(setf arr (make-array '(2 3)))
(println arr)

(setf a (make-array 4))
(println a)

(setf (aref a 3) 'c)
(println a)

(println (length a))


(setf vec (vector 'abc 'c "str"))
(println vec)

(println (svref vec 1))
