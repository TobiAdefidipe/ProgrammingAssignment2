## The pair of functions cache the inverse of a matirx
#Tobi Adefidipe
##Coursera

## function makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {           # initialize a function that requires a matrix as the argument
 m <- NULL                                            # initialize a local variable matrix (m) to the function  to NULL 
 
 
 set  <- function (y) {                               #resets the matrix value and sets the cached x value to the passed input
   x <<- y                                            #set x for the function ebvironment to y
   m <<- NULL                                         #set m for the makeCacheMatrix enviroment to NULL
 }
 
 get <-  function ()x                                 #Create a subfunction get
 matrixcreate <- function (solve) m_inv<<- solve      #Finds the inverse of m and assigns it to m
 getmatrix <- function () m                           #returns the value of m
 list (set= set, get = get, 
       matrixcreate = matrixcreate,                   #List out the values of the function
       getmatrix=getmatrix)
}


## function cacheSOlve computes the inverse of the special matix returned by the makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getmatrix()                                #Goes to the x enviroment and assigns the m value to this one 
    if (!is.null(m)) {                                #If the inverse already exists, 
      message ("getting cached data")                 #print the message "getting cached data"  
      return (m)                                      #print the value of m
    }
    
    data <- x$get()                                   #If inverse does not exist, pull x into a local variable called data 
    m <- solve(data, ...)                             # Solve for the inverse
    
    x$matrixcreate(m)                                 #assign the value to the x enviroment so it can be stored in the cached memory
    m                                                 #display the value of m
        
}





