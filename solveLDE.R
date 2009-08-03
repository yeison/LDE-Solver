# To set up random test variables, run the sLinit.R script

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

# The function below plots the data points contained in a matrix
# row by row, assigning different colors to each row.
plotLDE = function(dataMatrix, plotType=NULL){
	size = dim(dataMatrix)[1]
	columns = dim(dataMatrix)[2]
	rows = dim(dataMatrix)[1]
	ymin = min(dataMatrix)
	ymax = max(dataMatrix)
	plot(1:columns, dataMatrix[1, ], xlab="Data Points", ylab="Gene Expression Values", xlim=c(0, columns), ylim=c(ymin, ymax))
	for(i in seq(1, rows)){
			points(1:columns, dataMatrix[i, ], col=i, type=plotType)
	}
	legend("topleft", "Legend", paste("G", 1:size, sep=""), col=1:size, fill=1:size)
}

LDEpositives = function(x){
	cols = dim(x)[2]
	odds = seq(1, cols, by=2)
	x = x[ ,odds]
	return(x)
}