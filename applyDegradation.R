applyDegradation <- function(bm){
	diag(bm) = rnorm(length(bm[1,]), -0.0006, 0.002)
	return(bm)
}