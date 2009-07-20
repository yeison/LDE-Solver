createNetwork <- function(topologyFile){
	topology = load_gold_standard(topologyFile)
	bm = bmat(dim(topology)[1])
	bm = bmat*topology
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
	saveSolution(xinit, syntheticNet, setNumber)
	
	syntheticData = solveLDE(xinit, syntheticNet, 5, 1440, 0.001)
	saveSynthData(syntheticData, setNumber)
	
	plotLDE(syntheticData)
}