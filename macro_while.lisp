(do ((x 1 (+ x 1)))
    ((> x 8))
  (princ x))



; (defmacro while (test &rest body)
; 	`(do ()
; 		((not ,test))
; 		,@body))

; (setf x 0)
; (while (< x 10)
; 	(princ x)
; 	(incf x))

; (terpri)

; (princ 
;     (macroexpand-1 
; 	    '(while (< x 10)
; 			(princ x)
; 			(incf x))))