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



## Before talking about Lisp let's talk about XML first
>Superficially XML is nothing more than a standardized syntax used to express arbitrary hierarchical data in human readable form.
* To-do lists
* web pages
* configuration files 
...
>What happens if we unleash our favorite XML parser on this to-do list? Once the data is parsed, how is it represented in memory? The most natural representation is, of course, a tree - a perfect data structure for hierarchical data. After all is said and done, XML is really just a tree serialized to a human readable form. Anything that can be represented in a tree can be represented in XML and vice versa. I hope you understand this idea. It's very important for what's coming next.

>Let's take this a little further. What other type of data is often represented as a tree? At this point the list is as good as infinite so I'll give you a hint at what I'm getting at - try to remember your old compiler course. If you have a vague recollection that source code is stored in a tree after it's parsed, you're on the right track. Any compiler inevitably parses the source code into an abstract syntax tree. This isn't surprising since source code is hierarchical: functions contain arguments and blocks of code. Blocks of code contain expressions and statements. Expressions contain variables and operators. And so it goes.

>Let's apply our corollary that any tree can easily be serialized into XML to this idea. If all source code is eventually represented as a tree, and any tree can be serialized into XML, then all source code can be converted to XML, right? Let's illustrate this interesting property by a simple example. Consider the function below:

>Lexer (词法分析) parser(语法分析器) -> abstract syntax tree

```
int add(int arg1, int arg2)
{
    return arg1 + arg2;
}
```
>Can you convert this function definition to its XML equivalent? Turns out, it's reasonably simple. Naturally there are many ways to do this. Here is one way the resulting XML can look like:

```
<define-function return-type="int" name="add">
    <arguments>
        <argument type="int">arg1</argument>
        <argument type="int">arg2</argument>
    </arguments>
    <body>
        <return>
            <add value1="arg1" value2="arg2" />
        </return>
    </body>
</define>
```

>We can go through this relatively simple exercise with any language. We can turn any source code into XML, and we can transform the resulting XML back to original source code. We can write a converter that turns Java into XML and a converter that turns XML back to Java. We could do the same for C++. 

> Take a good look at the XML version of our "add" function above. How would you classify it? Is it data or code? If you think about it for a moment you'll realize that there are good reasons to put this XML snippet into both categories. It's XML and it's just information encoded in a standardized format. We've already determined that it can be generated from a tree data structure in memory (that's effectively what GCC-XML does). It's lying around in a file with no apparent way to execute it. We can parse it into a tree of XML nodes and do various transformations on it. It's data. But wait a moment! When all is said and done it's the same "add" function written with a different syntax, right? Once parsed, its tree could be fed into a compiler and we could execute it. We could easily write a small interpreter for this XML code and we could execute it directly. Alternatively, we could transform it into Java or C++ code, compile it, and run it. It's code.


> So, where are we? Looks like we've just arrived to an interesting point. A concept that has traditionally been so hard to understand is now amazingly simple and intuitive. Code is also always data! 






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





