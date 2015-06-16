# cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

# get inverse from cache
    inv <- x$getinverse()
    
# if cached inverse already exist,  return it   
    if(!is.null(inv)) {
        message("Cached data existed.")
        return(inv)
    }
    
# if cached inverse doesn't exist, create and store it    
    message("No cached data, create new cached data")		
    data <- x$get()
    
# use solve(x) function to reture x  inverse    
    inv <- solve(data)
    x$setinverse(inv)
    inv
}

# Use the following code to do a sample run:
# > x<-matrix(1:4, 2,2)
# > m = makeCacheMatrix(x)
# > m$get()
#     [,1] [,2]
#[1,]    1    3
#[2,]    2    4

# No cache in the first run cacheSolve
# > cacheSolve(m)
# No cached data, create new cached data
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5

# Cached data should exist in the 2nd run
# > cacheSolve(m)
# Cached data existed.
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
