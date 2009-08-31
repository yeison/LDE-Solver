extractTraj <- function(synth, npoints) {
	rows = dim(synth)[1]
	cols = dim(synth)[2]
	dt = rows/npoints	
	extracted = matrix(0, nrow=cols, ncol=npoints)
	extracted[,1] = as.matrix(synth[1,])
	for (i in 2:npoints)
		extracted[,i] = as.matrix(synth[i*dt, ])
	return(extracted)
}