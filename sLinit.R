# initial variables to be used for testing the 
# LDE (Linear Differential Equation) solver.


xran = function(x){
	xran = rnorm(x)
	return(xran)
}
bmat = function(x){
	bmat = matrix(rnorm(x^2, 0, 0.005), nc=x)
	return(bmat)
}

source("/Users/yeison/development/LDE/solveLDE.R")
source("/Users/yeison/development/LDE/lgs.R")
source("/Users/yeison/development/LDE/applyDegradation.R")

xr = xran(10)
bm = bmat(10)