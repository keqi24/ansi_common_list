(defmacro todo (name &rest body)
	`(progn 
		(format t "~A~%" ,name)
		,@body
		(terpri)))

(defmacro item (priority node)
	`(format t "  * ~A (~A) ~%" ,node ,(car (cdr priority))))

(load "todo_list.txt")
