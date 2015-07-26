## The below functions pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    # Define set function
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # Define get function
    get <- function() x
    
    # Define set inverse function
    setinverse <- function(inv) m <<- inv
    
    # Define get inverse function
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    # Check if the cache matrix exists. 
    if(is.null(a)) {
        a<<-makeCacheMatrix(x)
    }
        m <- a$getinverse()
        
    # Check if the inverse matrix is saved in cache.
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- a$get()
    m <- solve(data, ...)
    a$setinverse(m)
    m
}
