(defmacro todo (name &rest body)
	`(progn 
		(format t "todo:~A~%" ,name)
		,@body))


; (defmacro item (priority node)
; 	`(progn 
; 		(print "Priority:")
; 		(print 	',(cdr priority))
; 		(print ,node)))

(defmacro item (priority node)
	`(format t "  item: ~A ~A ~%" ,node ',(cdr priority)))


(todo "housework"
    (item (priority high) "Clean the house.")
    (item (priority medium) "Wash the dishes.")
    (item (priority medium) "Buy more soap."))