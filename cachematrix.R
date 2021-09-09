## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function:
  #1. Sets the matrix value
  #2. Gets the martrix value
  #3. Set the inverse of the matrix
  #4. Gets the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#The function returns the inverse of 2x2 matrix.
#If the value is already calculate then the result will cached. 
#You can see an example of when the function returns cached data if the same function is run twice

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


m <- matrix(1:4,2,2)
m
solve(m)
m2 <- makeCacheMatrix(m)
cacheSolve(m2)
cacheSolve(m2)
