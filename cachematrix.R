## Caching the results of an operation: we have a function that wraps a matrix 
## and can keep a value for the inverse with it. The second function can operate
## on this wrapper by checking for a stored inverse and calculating it when 
## required

## this is where we create a combination of matrixand its (initially empty) inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## this function does the actual calculation and stores it with the matrix 
## for later use
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  if(!is.null(i)) {
    message("using cached data")
  }else{
    data <- x$get()
    ## this is the actual operation that we cache
    i <- solve(data, ...)
    x$setinv(i)
  }
  i
}
