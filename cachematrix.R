## Caching the results of an operation: we have a function that wraps a matrix 
## and can keep a value for the inverse with it. Unlike the example in the readme,
## I have tried to better encapsulate the functionality inside the same object.
## The setinv function has been removed and getinv does the caching. I left a
## dummy implementation of cacheSolve.

## this is where we create a combination of matrixand its (initially empty) inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  getinv <- function() {
    if(!is.null(i)) {
      message("using cached data")
    }else{
      ## this is the actual operation that we cache
      i <<- solve(x)
    }
    i
  }
  list(set = set, get = get,
       getinv = getinv)
}
cacheSolve <- function(x){x$getinv()}
