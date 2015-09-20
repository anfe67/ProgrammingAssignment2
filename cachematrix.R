## NOTE: See also README.md
##
## makeCacheMatrix defines our "object wrapper", it defines an "extended" matrix object: 
## 
## Variables of interest
## 
## mat_obj: Our input matrix
## mat_inv: The inverted matrix, initially set to NULL 
## 
## Helper functions: 
##
## get: Returns mat_obj 
## set: Sets    mat_obj
## setinverse: Sets mat_inv 
## getinverse  Returns the current value of mat_inv (can be NULL)
## 
## Usage example : This makes a matrix (printing out the list of methods)
##    my_threebythree_matrix<-makeCacheMatrix(matrix(c(1,2,3,4,5,6,7,8,8),3,3)) 
##
## Getting back the matrix:  
##   my_threebythree_matrix$get()

makeCacheMatrix <- function(mat_obj = matrix()) {
      
      # Just trying to mimick the vector example... 
      
      # set the cached result to NULL  
      mat_inv <- NULL
      
      # object setter, y is our parameter and shall become "our environment"s x
      set <- function(y) {
            mat_obj <<- y
            mat_inv <<- NULL
      }
      
      # getter for the object 
      get <- function() mat_obj
      
      # Should 
      setinverse <- function(y) mat_inv <<- y
      
      getinverse <- function() mat_inv
      # List of 4 methods as in vector mean example
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## The cacheSolve function computes the inverse of a matrix only when 
## it finds it equals to NULL. 

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'. I call the temporary 
      ## result tmpmat (to avoid confusion with matrix above)
      tmpmat <- x$getinverse()
      
      ## Did we get anything? If yes, inverse is already cached
      if(!is.null(tmpmat)) {
            message("getting cached data")
            return(tmpmat)
      }
      
      ## Since we did not return, this is the first time we call, there was no cached data
      ## so we calculate it 
      data <- x$get()
      
      ## The solve function can output some warnings, I surround it with suppressWarnings
      ## to silence them 
      tmpmat <- suppressWarnings(solve(data, ...))
      x$setinverse(tmpmat)
      tmpmat
}
