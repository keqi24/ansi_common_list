(defmacro nil! (x)
	(list 'setf x nil))

(defparameter s 1)
(nil! s)
(print s)

(print (macroexpand-1 '(nil! x)))


;use of "`"
(defparameter a 1)
(defparameter b 2)
(print `(a is ,a and b is ,b))

;user of ",@"
(defparameter lst '(a b c))
(print `(lst is ,lst))
(print `(lst is ,@lst))

;define our own while macro
(defmacro while (test &rest body)
	`(do ()
		((not ,test))
		,@body))

(let ((x 0))
	(while (< x 10)
		(print x)
		(incf x)))






(format t "~%")