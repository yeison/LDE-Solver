# the solveLDE function utilizes a numerical approach to
# solve a system of ODEs.  It is a difference method
# employing an algorithm that models Hill kinetics as per 
# Hinze et al (2007).  For the purposes of simulating gene 
# transcript levels, we introduce noise to compensate for 
# some external factors that are not otherwise accounted for.
 
solveLDE = function(initialTranscriptLevels, interactionMatrix, dt=5, numberOfIntervals=1440, noise=0.01){
	x = initialTranscriptLevels
	b = interactionMatrix
	time = dt*numberOfIntervals
	T = seq(0, time, by=dt)
	T_intervals = seq(1, length(T))
	rowsx=dim(b)[1]
#	alpha = rep(0.1, rowsx)
	c = rep(0, rowsx)
	
	x_new = matrix(0, nr=rowsx, nc=length(T_intervals)+1)
	x_new[,1] = x
	x = x_new

	for(t in T_intervals){

		for(i in seq_len(rowsx)){
			if((temp = dt*(sum(b[,i]*x[,t]) + c[i]) + x[i, t]) >= 0)
				x[i, (t + 1)] = temp+rnorm(1)*temp*noise
			else
				x[i, (t + 1)] = 0
		}
	}
	return(x)
}