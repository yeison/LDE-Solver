# The function createNetwork uses load_gold_standard to get a network
# topology using the topologyFile as input.
createNetwork <- function(topologyFile){
	topology = load_gold_standard(topologyFile)
	bm = bmat(dim(topology)[1])
	bm = bm*topology
	bm = applyDegradation(bm)
	return(bm)
}

# The initialValues function provides the program with a set of initial
# transcript level values.  The input ratiosFile is a file containing 
# the ratios of transcript, usually taken from GeneNetWeaver trajectories.
initialValues <- function(ratiosFile){
	load(ratiosFile)
	xinit = ratios[,1]
	return(xinit)
}

# runSim takes a gold standard file (this file may be output from GeneNetWeaver,
# or it is provided at the end of the DREAM challenge), a ratiosFile containing
# the initial value of transcript, and a setNumber used to identify the simulation. 
runSim <- function(topologyFile, ratiosFile, setNumber){
	syntheticNet = createNetwork(topologyFile)
	xinit = initialValues(ratiosFile)

	maxInitial = max(xinit)
	
	# Run the ODE solving algorithm.
	syntheticData = solveLDE(xinit, syntheticNet, 5, 1440, 0.01)
	# Extract a subset of points from the whole data set.
	extract = extractTraj(syntheticData, 21)

	
#	while(max(syntheticData) > 2*maxInitial){
#		laregRows = NULL
#		for(i in seq_len(dim(syntheticData)[1])){
#			if(max(syntheticData[i,]) > 2*maxInitial)
#				largeRows = append(laregRows, i)
#		}
#	
#		syntheticNet[ , laregRows] = syntheticNet[ , laregRows]/2
#		#	browser()
#		syntheticData = solveLDE(xinit, syntheticNet, 5, 1440, 0.001)
#	}
	# saveExtract saves the 21 points extracted from a simulation.
	saveExtract(extract, setNumber)
	# saveSolution saves the interaction matrix (synthetic network) and
	# initial values used.
	saveSolution(xinit, syntheticNet, setNumber)
	# saveSynthData saves the transcript values output by the simulation.
	saveSynthData(syntheticData, setNumber)
	
	plotLDE(syntheticData)
}