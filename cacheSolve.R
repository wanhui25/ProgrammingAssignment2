cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("Cached data existed.")
        return(inv)
    }
    message("No cached data, create new cached data")		
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
	
}