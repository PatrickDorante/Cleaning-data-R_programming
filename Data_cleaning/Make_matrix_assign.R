# Patrick Programing Assignment 2 with R
#makeVector <- function(x = numeric()) {
#  m <- NULL
#  set <- function(y) {
#    x <<- y
#    m <<- NULL
#  }
#  get <- function() x
#  setmean <- function(mean) m <<- mean
#  getmean <- function() m
#  list(set = set, get = get,
#       setmean = setmean,
#       getmean = getmean)
# }

# cachemean <- function(x, ...) {
#  m <- x$getmean()
# if(!is.null(m)) {
#    message("getting cached data")
#    return(m)
# }
#  data <- x$get()
#  m <- mean(data, ...)
##  x$setmean(m)
#  m
#}


# The first function, makeVector creates a special "vector", which is really a list containing a function to

# set the value of the vector

# the value of the vector

# set the value of the mean

# get the value of the mean

# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  minv <- NULL
  set <- function(y) {
    x <<- y
    minv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) minv <<- inverse
  getinverse <- function() minv
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
  minv <- x$getinverse()
  if (!is.null(minv)) {
    message("getting cached data")
    return(minv)
  }
  data <- x$get()
  minv <- solve(data, ...)
  x$setinverse(minv)
  minv
}




