# Matrix inversion is usually a costly computation and there may be 
# some benefit to caching the inverse of a matrix rather than compute it repeatedly. 
# This assignment is to write a pair of functions that cache the inverse of a matrix

# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
	# 1. set the value of the matrix
	# 2. get the value of the matrix
	# 3. set the value of the matrix
	# 4. get the value of the matrix

# define function and input pararmeter as matrix()
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(	set=set, get=get, 
		setinverse=setinverse, 
		getinverse=getinverse)
}
