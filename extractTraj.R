# The function extractTraj will extract the given number of 
# points of data, divided into even intervals, from the provided
# syntheticDataSet.
extractTraj <- function(syntheticDataSet, numberOfPoints) {
	extractWithNoise(syntheticDataSet, numberOfPoints, 0)
}

# extractWithNoise adds the given amount of noise to the extracted
# points.  This is to simulate something such as an assay, where
# experimental error may yield some unwanted errors in the results. 
extractWithNoise <- function(syntheticDataSet, numberOfPoints, noise){
	synth = syntheticDataSet
	npoints = numberOfPoints
	rows = dim(synth)[1]
	dt = dim(synth)[2]/npoints	
	extracted = matrix(0, nr=rows, nc=npoints)
	extracted[ ,1] = synth[ ,1]
	for (i in 2:npoints)
		extracted[ ,i] = synth[ ,i*dt] + synth[ ,i*dt]*rnorm(1, 0, noise)
	return(extracted)
}

# Abbreviated function name.
ewn <- extractWithNoise


extractWithMeanNoise <- function(syntheticDataSet, numberOfPoints){
	synth = syntheticDataSet
	npoints = numberOfPoints
	rows = dim(synth)[1]
	dt = dim(synth)[2]/npoints	
	extracted = matrix(0, nr=rows, 	nc=npoints)
	extracted[ ,1] = synth[ ,1]
	for(i in 2:npoints){
		for(j in 1:rows){
			meanNoise = mean(synth[j, ])
			stdv = sd(synth[j,])
			if((temp = synth[j, i*dt] + rnorm(1, meanNoise, stdv)) > 0)
				extracted[j, i] = temp
			else
				if(extracted[j, i] < 0)
					extracted[j, i] = 0
		}
	}
	return(extracted)
}

ewmn <- extractWithMeanNoise