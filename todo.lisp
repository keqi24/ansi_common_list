(defmacro todo (name &rest body)
	`(progn 
		(format t "~A~%" ,name)
		,@body))


; (defmacro item (priority node)
; 	`(progn 
; 		(print "Priority:")
; 		(print 	',(cdr priority))
; 		(print ,node)))

(defmacro item (priority node)
	`(format t "  * ~A ~A ~%" ,node ',(car (cdr priority))))


; (todo "housework"
;     (item (priority high) "Clean the house.")
;     (item (priority medium) "Wash the dishes.")
;     (item (priority medium) "Buy more soap."))

; (defmacro printTodo (file)
; 	`(let ((in (open ,file)))
; 		(let ((data (loop for line = (read-line in nil)
; 			while line collect line)))
; 			(princ (car data))
; 		(close in)))


; (setf in (open "todo_list.txt"))
; (setf data (loop for line = (read-line in nil)
; 	while line collect line))
; (princ data)
; (close in)

; (printTodo "todo_list.txt")

; (todo "housework"     (item (priority high) "Clean the house.")
;      (item (priority medium) "Wash the dishes.")
;      (item (priority medium) "Buy more soap."))


(load "todo_list.txt")