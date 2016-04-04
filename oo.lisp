
;use slot value
; (defclass circle ()
; 	(radius center))

; (setf c (make-instance 'circle))

; (print c)

; (setf (slot-value c 'radius) 1)
; (print (slot-value c 'radius))

;use accesor
; (defclass circle ()
; 	((radius :accessor circle-radius)
; 		(center :accessor circle-center)))

; (setf c (make-instance 'circle))

; (setf (circle-radius c) 1)
; (print (circle-radius c))

;use init argument
; (defclass circle ()
; 	((radius :accessor circle-radius
; 			 :initarg :radius
; 			 :initform 1)
; 	 (center :accessor circle-center
; 	 		 :initarg :center
; 	 		 :initform (cons 0 0))))

; (setf c (make-instance 'circle  :radius 5))
; (print (circle-radius c))
; (print (circle-center c))

;use static property
(defclass tabloid()
	((top-story :accessor tabloid-story
				:allocation :class)))

(setf first-tabloid (make-instance 'tabloid))
(setf second-tabloid (make-instance 'tabloid))
(setf (tabloid-story first-tabloid) 'hello-world)
(print (tabloid-story second-tabloid))


