(defmacro todo (name &rest body)
	`(progn 
		(format t "~A~%" ,name)
		,@body
		(terpri)))

(defmacro item (priority node)
	`(format t "  * ~A (~A) ~%" ,node ,(car (cdr priority))))

(load "todo_list.txt")

; (defmacro execute_file (file)
; 	`(let ((data 
; 				(with-open-file (stream ,file)
; 					(read stream))))
; 		data))

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

; (defmacro test ()
; 	`(TODO "housework" (ITEM (PRIORITY HIGH) "Clean the house.")
;       (ITEM (PRIORITY MEDIUM) "Wash the dishes.")
;       (ITEM (PRIORITY MEDIUM) "Buy more soap."))

; (print (macroexpand-1 `(load "todo_list.txt")))
; (test)

; (eval (execute_file "todo_list.txt"))

; (PROGN
;  (FORMAT T "~A~%" "housework")
;  (ITEM (PRIORITY HIGH) "Clean the house.")
;  (ITEM (PRIORITY MEDIUM) "Wash the dishes.")
;  (ITEM (PRIORITY MEDIUM) "Buy more soap.")) 


; (print
; 	(with-open-file (stream ,"todo_list.txt")
; 			(read stream))


