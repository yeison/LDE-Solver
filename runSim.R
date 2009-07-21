createNetwork <- function(topologyFile){
	topology = load_gold_standard(topologyFile)
	bm = bmat(dim(topology)[1])
	bm = bm*topology
	bm = applyDegradation(bm)
	return(bm)
}

initialValues <- function(ratiosFile){
	load(ratiosFile)
	xinit = ratios[,1]
	return(xinit)
}

runSim <- function(topologyFile, ratiosFile, setNumber){
	syntheticNet = createNetwork(topologyFile)
	xinit = initialValues(ratiosFile)

	maxInitial = max(xinit)
	
#	browser()
	syntheticData = solveLDE(xinit, syntheticNet, 5, 1440, 0.001)
#	browser()
	
	while(max(syntheticData) > 2*maxInitial){
		laregRows = NULL
		for(i in seq_len(dim(syntheticData)[1])){
			if(max(syntheticData[i,]) > 2*maxInitial)
				largeRows = append(laregRows, i)
		}
	
		syntheticNet[ , laregRows] = syntheticNet[ , laregRows]/2
		#	browser()
		syntheticData = solveLDE(xinit, syntheticNet, 5, 1440, 0.001)
	}

	saveSolution(xinit, syntheticNet, setNumber)
	saveSynthData(syntheticData, setNumber)
	
	plotLDE(syntheticData)
}