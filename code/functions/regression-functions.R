residual_sum_squares <- function(x){
	sum(x$residuals^2)
}

total_sum_squares <- function(x){

	sum(((x$model[[1]])-mean(x$model[[1]]))^2)

}

r_squared <- function(x){

	1-(residual_sum_squares(x)/total_sum_squares(x))

}

f_statistic <- function(x){

	TSS <- total_sum_squares(x)
	RSS <- residual_sum_squares(x)
	p <- length(coefficients(x)) - 1
	n <- length(x$fitted.value)

	f <- ((TSS-RSS)/p)/(RSS/(n - p - 1))
	f
}

residual_std_error <- function(x){

	RSS <- residual_sum_squares(x)
	n <- length(x$fitted.value)
	p <- length(coefficients(x)) - 1
	rse <- sqrt(RSS/(n-p-1))

	rse
}