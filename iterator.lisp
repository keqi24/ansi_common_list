(defun show-square (start end)
	(do ((i start (+ i 1)))
		((> i end) 'done)
		(format t "~A ~A~%" i (* i i))))

(print (show-square 1 99))