applyDegradation <- function(bm){
<<<<<<< HEAD:applyDegradation.R
	diag(bm) = rnorm(length(bm[1,]), -0.0006, 0.0002)
=======
	diag(bm) = rnorm(length(bm[1,]), -0.0006, 0.002)
>>>>>>> 7fa0628e5a0398be26c0e7c7ec0c41312ee3d232:applyDegradation.R
	return(bm)
}