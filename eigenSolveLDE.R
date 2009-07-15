eigenSolveLDE <- function(x_init, bm, dt, intervals){
	time = dt*intervals
	T = seq(0, time, by=dt)
	T_intervals = seq(1, length(T))
	
	geneCount = length(x_init)
	eigenValues = eigen(bm)[[1]]
	eigenVectors = eigen(bm)[[2]]
	
	x = matrix(0, nr=geneCount, nc=length(T_intervals))
	
	constants = solve(eigenVectors, x_init)
	
	for(t in T_intervals)
		for(i in 1:geneCount)
			x[i, t] = sum(constants*exp(eigenValues*t)*eigenVectors[i,])
	
	return(x)
	}