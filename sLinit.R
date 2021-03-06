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

source("LDE/solveLDE.R")
source("LDE/lgs.R")
source("LDE/applyDegradation.R")
source("LDE/saveSynthetic.R")
source("LDE/runSim.R")
source("LDE/extractTraj.R")

#xr = xran(10)
#bm = bmat(10)