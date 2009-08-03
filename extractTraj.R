extractTraj <- function(synth, npoints) {
	rows = dim(synth)[1]
	dt = dim(synth)[2]/npoints	
	extracted = matrix(0, nr=rows, nc=npoints)
	extracted[,1] = synth[,1]
	for (i in 2:npoints)
		extracted[,i] = synth[ ,i*dt]
	return(extracted)
}