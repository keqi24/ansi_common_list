(defun println (obj)
	(write obj)
	(write-line ""))

(defun finder (obj vec start end)
	(if (eq start end)
		(if (eq (aref vec start) obj)
			(obj)
			nil)
		(if (> start end)
			nil
			(let ((mid (+ start (round (/ (- end start) 2)))))
				(let ((obj2 (aref vec mid)))
					(if (eq obj obj2)
						obj
						(if (< obj obj2)
							(finder obj vec start (- mid 1))
							(finder obj vec (+ mid 1) end))))))))

(defun binary-search (obj vec)
	(let ((len (length vec)))
		(and (not (zerop len))
			(finder obj vec 0 (- len 1)))))


(setf vec (vector 1 2 3 5 6 7))
(println vec)

(println (binary-search 4 vec))
