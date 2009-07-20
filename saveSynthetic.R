saveSolution <- function(xinit, bm, setNumber){
	size = length(xinit)
	solutionList = list(xinit, bm)
	
	
	names(solutionList) = list(paste("xinit", setNumber, "size", size, sep=""), paste("bm", setNumber, "size", size, sep=""))
	
	solutionList
		
	save(solutionList, file=paste("size", size, "Synth", setNumber, "Solution", ".RData", sep=""))
	
}

saveSynthData <- function(syntheticDataSet, setNumber){
	synth = syntheticDataSet
	size = length(synth[,1])
	
	synth = list(synth)
	names(synth) = paste("Synthetic Network", setNumber, "Size", size)
	
	labels(synth) 
	
	save(synth, file=paste("size", size, "Synth", setNumber, "Data", ".RData", sep=""))
		
}

openSynthData <- function(file){
	load(file)
	print(labels(synth))
	return(synth[[1]])
}

openSolution <- function(file){
	load(file)
	print(labels(solutionList))
	return(solutionList)
}

# The function probeData prints information about the contents of a data set containing
# a regulatory network and  its initial starting conditions, or a data set of synthetic 
# gene expression values.
probeData <- function(file){
	load(file)
# WARNING: BUGGY function
	tryCatch(labels(synth), warning = function(e) labels(solutionList))
	# try synthetic data set, if not a synthetic data set try a solutionlist.
}