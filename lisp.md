# Preface

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



#Code as data


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


## Any use of this or any programe use XML as code
Like Ant and Maven.
How Ant works?
```
<project>

    <target name="clean">
        <delete dir="build"/>
    </target>

    <target name="compile">
        <mkdir dir="build/classes"/>
        <javac srcdir="src" destdir="build/classes"/>
        <copy todir="../new/dir">
            <fileset dir="src_dir"/>
        </copy>
    </target>

    <target name="jar">
        <mkdir dir="build/jar"/>
        <jar destfile="build/jar/HelloWorld.jar" basedir="build/classes">
            <manifest>
                <attribute name="Main-Class" value="oata.HelloWorld"/>
            </manifest>
        </jar>
    </target>

    <target name="run">
        <java jar="build/jar/HelloWorld.jar" fork="true"/>
    </target>

</project>

```

>The snippet above copies a source directory to a destination directory. Ant locates a "copy" task (a Java class, really), sets appropriate parameters (todir and fileset) by calling appropriate Java methods and then executes the task.
>Ant comes with a set of core tasks and anyone can extend it with tasks of their own simply by writing Java classes that follow certain conventions. Ant finds these classes and executes them whenever XML elements with appropriate names are encountered. Pretty simple. 

> it acts as an interpreter for a language that uses XML as its syntax by translating XML elements to appropriate Java instructions.

## Why use XML?
```
<copy todir="../new/dir">
    <fileset dir="src_dir"/>
</copy>
```

```
CopyTask copy = new CopyTask();
Fileset fileset = new Fileset();

fileset.setDir("src_dir");
copy.setToDir("../new/dir");
copy.setFileset(fileset);

copy.execute();
```

>The code is almost the same, albeit a little longer than the original XML. So what's different? The answer is that the XML snippet introduces a special semantic construct for copying. If we could do it in Java it would look like this:

```
copy("../new/dir")
{
    fileset("src_dir");
}
```
>If we had an automatic converter from XML to Java it would likely produce the above gibberish. The reason for this is that Java's accepted syntax tree grammar is fixed by the language specification - we have no way of modifying it. We can add packages, classes, methods, but we cannot extend Java to make addition of new operators possible. Yet we can do it to our heart's content in XML - its syntax tree isn't restricted by anything except our interpreter! 


>For complex operators this ability provides tremendous benefits. Can you imagine writing special operators for checking out source code, compiling files, running unit testing, sending email? Try to come up with some. If you're dealing with a specialized problem (in our case it's building projects) these operators can do wonders to decrease the amount of code you have to type and to increase clarity and code reuse. Interpreted XML makes this extremely easy to accomplish because it's a simple data file that stores hierarchical data. We do not have this option in Java because it's hierarchical structure is fixed 


## Lisp
```
(copy 
    (todir ".../new/dir")
    (fileset (dir "src_dir")))
```

Lisp == (list processing)

```
(* 1 2)
(+ 2 3)
```

>When a Lisp system encounters lists in the source code it acts exactly like Ant does when it encounters XML - it attempts to execute them. In fact, Lisp source code is only specified using lists, just like Ant source code is only specified using XML. Lisp executes lists in the following manner. The first element of the list is treated as the name of a function. The rest of the elements are treated as functions parameters. If one of the parameters is another list it is executed using the same principles and the result is passed as a parameter to the original function. That's it. We can write real code now:


>Note that so far every list we've specified was treated by a Lisp system as code. But how can we treat a list as data? Again, imagine an Ant task that accepts XML as one of its parameters. In Lisp we do this using a quote operator ' like so:

```
'(* 1 2)
'(+ 2 3)

(car '(+ 1 2))
(cdr '(+ 2 3))
(cons '+ '(1 2))
(eval (cons '+ '(1 2)))
```

**Code as data and data as Code**

>You can think of built in Lisp functions as you think of Ant tasks. The difference is that we don't have to extend Lisp in another language (although we can), we can extend it in Lisp itself as we did with the times-two example. Lisp comes with a very compact set of built in functions - the necessary minimum. The rest of the language is implemented as a standard library in Lisp itself.



```
(defun add
    (arg1 arg2)
    (+ arg1 arg2))
```



# Write a program that writes programs










```
<todo name="housework">
    <item priority="high">Clean the house.</item>
    <item priority="medium">Wash the dishes.</item>
    <item priority="medium">Buy more soap.</item>
</todo>
```


```
(defmacro todo (name &rest body)
    `(progn 
        (format t "todo:~A~%" ,name)
        ,@body))

(defmacro item (priority node)
    `(format t "  item: ~A ~A ~%" ,node ',(cdr priority)))


(todo "housework"
    (item (priority high) "Clean the house.")
    (item (priority medium) "Wash the dishes.")
    (item (priority medium) "Buy more soap."))
```





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





