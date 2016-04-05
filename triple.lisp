; (defmacro triple (x)
; 	`(* 3 ,x))


; (princ (triple 10))
; (terpri)
; (princ (triple (+ 5 5)))
; (terpri)


(defmacro while (test &rest body) 
	`(do ()
		((not ,test))
		,@body))

(setf x 0)
(while (< x 10)
	(princ x)
	(terpri)
	(incf x))