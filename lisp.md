##1. Before introdue what is Lisp, I want to show how to write code using lisp

```
(print "hello world")

(+ 2 3)
(+ 2 3 4 5 6)

(defun add2 (x) (+ x 2))
(add2 10)

(defun oddp (x) 
	(if (= (mod x 2) 1)
		T
		NIL))
```

##2. What's your first impression to Lisp?
* Syntax is weird
* Diffrent
* Polish prefix notation
* Full of parenthese


##3. What is Lisp?
* Invent by John McCarthy 1958
* Second-oldest high-level programming language(only Fortran is older by one year)
* Fully parenthesized Polish prefix notation.
* Own a number of dialects


##4. Lisp in the eyes who love it˛
God use Lisp

## 5. Lisp in the eyes who don't like it
WTF

## 6. in my eyes
* Functional programming
* H (Code as data)
* Bottom-up programming

## 7. Functional programming
>In most languages the + operator is something quite different from user-defined functions. But Lisp has a single model, function application, to describe all the computation done by a program. The Lisp + operator is a function, just like the ones you can define yourself.
>Lisp itself is a collection of functions
>Functions they are Lisp objects.

```
(function +)
#'+

defun add2 (x) (+ x 2))
#'add2

(setf (symbol-function 'add) #'+)
#'add

;lambda
(FUNCALL (LAMBDA (x y) (+ x y)) 2 3)

(apply #'add '(1 2 3 4 5))

(defun make-adder (n) 
	#'(lambda (x) (+ x n)))

(setf add2 (make-adder 2))
(funcall add2 100)

(mapcar add2 '(1 2 3))

(sort '(2 4 1 5 2 4) #'<)
```

## 8. Code as data
* simple form 
 atom or list 

* list (list proccessing)

```
;build a list
(list + 2 3)

(+ 2 3)
(quote (+ 2 3))
'(1 2 3)

```





