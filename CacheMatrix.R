# Matrix inversion is usually a costly computation and there may be 
# some benefit to caching the inverse of a matrix rather than compute it repeatedly. 
# This assignment is to write a pair of functions that cache the inverse of a matrix


# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
	
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the matrix
# 4. get the value of the matrix


# define makeCacheMatrix function and input pararmeter as matrix()

makeCacheMatrix <- function(x = matrix()) {

# declae cache variable and initiaize it to NULL
    
	cache<- NULL
    
# create the matrix    
    
	set <- function(y) {
        
		x <<- y
        
		cache<<- NULL
    
	}
    

# get the value of matrix    

	get <- function() x
    

# invert the matrix and store
    
	setinverse <- function(inverse) cache<<- inverse
    
# get inverted matrix from cache    
    
	getinverse <- function() cache

# return the created function to the working environment    

	list(	set=set, get=get,
		setinverse = setinverse,		
		getinverse=getinverse)

}



# cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

# get inverse from cache and store into cache variable
    
	cache <- x$getinverse()

# if cached inverse already exist,  return it   
    
	if(!is.null(cache)) {
        
	message("Cache data existed.")
        
	return(cache)
    
	}
  
# if cached inverse doesn't exist, create and store it    
    
message("No cache data, create new cache data")		
    
	data<-x$get()
 

# use solve(x) function to reture inverse  and store for 2nd run  
	cache<-solve(data)   
	x$setinverse(cache)
	cache
}

# Use the following code to do a sample run:
# > source("CacheMatrix.R")
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
