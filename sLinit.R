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

source("./solveLDE.R")
source("./lgs.R")
source("./applyDegradation.R")

xr = xran(10)
bm = bmat(10)