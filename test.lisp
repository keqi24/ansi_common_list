; (write-line "hello world")

(defun println (obj)
	(write obj)
	(write-line ""))

; (setf x (cons 'a nil))

; (println x)

; (defun our-listp (x)
; 	(or (null x) (consp x)))

; (println (our-listp '(a b c)))

(setf x (cons 'a nil))
(setf y (cons 'a nil))


(println (eq x y))
(println (equal x y))