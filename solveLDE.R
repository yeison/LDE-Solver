solveLDE = function(x, b, dt, intervals, noise){
	time = dt*intervals
	T = seq(0, time, by=dt)
	T_intervals = seq(1, length(T))
	rowsx=dim(b)[1]
#	alpha = rep(0.1, rowsx)
	c = rep(0, rowsx)
	
	x_new = matrix(0, nr=rowsx, nc=length(T_intervals)+1)
	x_new[,1] = x
	x = x_new
#	browser()

	for(t in T_intervals){
#	browser()
		for(i in seq_len(rowsx)){
#			browser()
			if((temp = dt*(sum(b[,i]*x[,t]) + c[i]) + x[i, t]) >= 0)
				x[i, (t + 1)] = temp+rnorm(1)*temp*noise
			else
				x[i, (t + 1)] = 0
#			browser()
		}
	}
	return(x)
}