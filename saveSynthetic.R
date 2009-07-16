saveSolution <- function(xinit, bm, setNumber){
	size = length(xinit)
	solutionList = list(xinit, bm)
	
	
	names(solutionList) = list(paste("xinit", setNumber, "size", size, sep=""), paste("bm", setNumber, "size", size, sep=""))
	
	solutionList
		
	save(solutionList, file=paste("synth", setNumber, "Solution", "Size", size, ".RData", sep=""))
	
}

saveSynthData <- function(syntheticDataSet, setNumber){
	synth = syntheticDataSet
	size = length(synth[,1])
	
	synth = list(synth)
	names(synth) = paste("synth", setNumber, "size", size)
	
	save(synth, file=paste("synth", setNumber, "Data", "Size", size, ".RData", sep=""))
		
}