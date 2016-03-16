(defun println (obj)
	(write obj)
	(write-line ""))

(defun compress (x)
	(if (consp x)
		(compr (car x) 1 (cdr x))
		x))


(defun n-elts (elt n)
	(if ( > n 1)
		(list n elt)
		elt))

(defun compr (elt n lst)
	(if (null lst)
		(list (n-elts elt n))
		(let ((next (car lst)))
			(if (eq next elt)
				(compr elt (+ n 1) (cdr lst))
				(cons (n-elts elt n)
					(compr next 1 (cdr lst)))))))


(println (compress '(1 1 1 0 1 0 0 0 1)))