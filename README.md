## Introduction

I have used exactly the same "schema" provided in the vector mean example in the assignment 
instructions.  

The first function (makeCacheMatrix) defines a wrapper object for a matrix, which I store 
internally as mat_obj. In practice  it defines an "extended" matrix object.

This wrapper contains a second matrix object, which initially is set to NULL 
and that shall contain the inverse of mat_obj. This I have called mat_inv. 

Upon creation of the initial object, mat_inv is set to NULL. It shall 
be only initialized the first time when a call to cacheSolve is made. Any 
successive call to cacheSolve shall return the cached object and no longer perform 
the inverse calculation. 

Use of the set function cause a change to mat_obj, therefore also the cached matrix is 
set to NULL (mat_inv<-NULL), and therefore the next call to cacheSolve() shall have to 
invert the new mat_obj. 


### Variables of interest
 
* mat_obj: Our input matrix
* mat_inv: The inverted matrix, initially set to NULL 
 
### Internal functions (methods): 

* get: Returns mat_obj 
* set: Sets    mat_obj
* setinverse: Sets mat_inv 
* getinverse  Returns the current value of mat_inv (can be NULL)
 
### Usage example 

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