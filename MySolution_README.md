### Introduction

The first function defines a wrapper for a matrix, which we call mat_obj. 
The wrapper contains a matrix object, which shall contain the inverse 
of mat_obj, which is mat_inv. This is initially set to NULL and shall 
be only initialized when cacheSolve is called the first time. 

makeCacheMatrix defines our "object wrapper", it defines an "extended" matrix object: 
 
## Variables of interest
 
* mat_obj: Our input matrix
* mat_inv: The inverted matrix, initially set to NULL 
 
## Helper functions: 

* get: Returns mat_obj 
* set: Sets    mat_obj
* setinverse: Sets mat_inv 
* getinverse  Returns the current value of mat_inv (can be NULL)
 
## Usage example 

The following makes a "makeCacheMatrix" object called my_threebythree_matrix (printing out the list of methods)

<pre><code>*    my_threebythree_matrix<-makeCacheMatrix(matrix(c(1,2,3,4,5,6,7,8,8),3,3)) </code></pre>

To get the original matrix:  
<pre><code>*    my_threebythree_matrix$get()</code></pre>

This shall output:  

<pre><code>
       [,1] [,2] [,3]
 [1,]    1    4    7
 [2,]    2    5    8
 [3,]    3    6    8
</code></pre>

First time call of cacheSolve: 
<pre><code>*    cacheSolve(my_threebythree_matrix)</code></pre>
  
Shall output: 

<pre><code>
            [,1]      [,2] [,3]
 [1,] -2.666667  3.333333   -1
 [2,]  2.666667 -4.333333    2
 [3,] -1.000000  2.000000   -1
</code></pre>

A second call shall output: 
<pre><code>
 getting cached data
            [,1]      [,2] [,3]
 [1,] -2.666667  3.333333   -1
 [2,]  2.666667 -4.333333    2
 [3,] -1.000000  2.000000   -1
 </code></pre>