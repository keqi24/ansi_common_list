;design a ntimes macro
;use like this

; (ntimes 10
; 	(print "."))

(defmacro ntimes (n &rest body) 
	`(do ((x 0 (incf x)))
		((>= x ,n) 'done)
		,@body))


;normal is ok
(ntimes 10
	(print "."))

;if use the same valaiable
(print (let ((x 10))
	(ntimes 5
		(setf x (+ x 1)))
	x))

;use gensyms rewrite macro
(defmacro ntimes-2 (n &rest body)
	(let ((g (gensym)))
		`(do ((,g 0 (incf ,g)))
			((>= ,g ,n))
			,@body)))

(print (let ((x 10))
	(ntimes-2 5
		(setf x (+ x 1)))
	x))