
createNames <- function(x, column){
	labels = sort(unique(x[,column]))
	len = length(labels)
	names = paste("G", 1:len, sep="")
	return(names)	
}

setupGSMatrix <- function(rowNames, colNames){
	x = matrix(0, length(rowNames), length(colNames))
	rownames(x) = rowNames
	colnames(x) = colNames
	return(x)
}

## January 2009 Inferelator
## Bonneau lab - Aviv Madar
## NYU - Center for Genomics and Systems Biology
## Modified by - Yeison Rodriguez

load_gold_standard <- function( file, r_names=NULL, c_names=NULL ) {
	x = as.matrix(read.table(file))
	if(ncol(x) == 3) {
		if(is.null(r_names)){
			r_names = createNames(x, 1)
		}
		if(is.null(c_names)){
			c_names = createNames(x, 2)
		}
		# Yeison: I Removed the error message when passing NULL values for row name and column
		# name.  Now the function will read these values directly from the file if they are not
		# provided by the user.
		y = setupGSMatrix(r_names, c_names)				
		idx_non_zero = which(as.numeric(x[,3]) != 0)
		for (i in 1:length(idx_non_zero)) {
			y[x[idx_non_zero[i],2],x[idx_non_zero[i],1]] = as.numeric(x[idx_non_zero[i],3])
		}
		return(y)	
	} 
	return(x)
}

# Temporary quick fix for matrices with incorrect gene labels
fixGeneLabels <- function(x){
	rLength = length(rownames(x))
	cLength = length(colnames(x))
	rLabels = paste("G", 1:rLength, sep="")	
	cLabels = paste("G", 1:cLength, sep="")	
	rownames(x) <- rLabels
	colnames(x) <- cLabels
	return(x)
}