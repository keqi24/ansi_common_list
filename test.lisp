; (write-line "hello world")

; (defun println (obj)
; 	(write obj)
; 	(write-line ""))

; (setf x (cons 'a nil))

; (println x)

; (defun our-listp (x)
; 	(or (null x) (consp x)))

; (println (our-listp '(a b c)))

; (setf x (cons 'a nil))
; (setf y (cons 'a nil))

; (println (eq x y))
; (println (equal x y))


; (defmacro as (tag content)
;   `(format t "<~(~A~)>~A</~(~A~)>"
;            ',tag ,content ',tag))

; (dotimes (i 10)
; 	(fresh-line)
; 	(print i))



; (defparameter content 'title)
; (print (format t "<~(~A~)>~A</~(~A~)>"
;            tag content tag))

; (as tag "content")
; (format t "~%")
; (format t "~(~)")
; (format t "<~(~A~)>~%" 'abc)
; (print 'abc)


; (defun fun (x)
; 	(list 'a (expt (car x) 2)))

; (print (fun '(2 2 3)))

; (defun 100+ (x) (+ 100 x))
; (defmacro 100+ (x) `(+ 100 ,x))

; (print (100+ 3))

; (setf data (loop for x in '("aaa" "bbb" "ccc")
; 	while x collect x))
; (princ data)

; (princ (concatenate 'string '("aaa" "bbb" "ccc"))


(let ((index 0))
	(incf index)
	(princ index)
	(terpri))





(copy 
    (todir ".../new/dir")
    (fileset (dir "src_dir")))




(print "hello world")

(+ 2 3)
(+ 2 3 4 5 6)

(defun add2 (x) (+ x 2))
(add2 10)

(defun oddp (x) 
	(if (= (mod x 2) 1)
		T
		NIL))



'(* 1 2)
'(+ 2 3)

(car '(+ 1 2))
(cdr '(+ 2 3))
(cons '+ '(1 2))
(eval (cons '+ '(1 2)))



(todo "housework"
    (item (priority "high") "Clean the house.")
    (item (priority "medium") "Wash the dishes.")
    (item (priority "medium") "Buy more soap."))




(defmacro todo (name &rest body)
	`(progn 
		(format t "~A~%" ,name)
		,@body
		(terpri)))

(defmacro item (priority node)
	`(format t "  * ~A (~A) ~%" ,node ,(car (cdr priority))))

(load "todo_list.txt")





