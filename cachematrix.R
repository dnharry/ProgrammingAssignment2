@@ -1,15 +1,55 @@
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  

  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  

  get <- function() {
    x
  }
  
 
  setinv <- function(i) {
    inv <<- i
  }
  
  getinv <- function() {
    inv
  }
  
  list(set = set,
       get = get,
       setinv = setinv,
       getinv = getinv)    
}


## Write a short comment describing this function
## Computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cachesolve will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  inv <- x$getinv()
  
  if(!is.null(inv)) {

    message("getting cached inverse")
    return(inv)
  }
  

  matr <- x$get()
  inv <- solve(matr, ...)
  x$setinv(inv)
  
  return(inv)
}
