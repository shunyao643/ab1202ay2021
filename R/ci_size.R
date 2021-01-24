#' Confidence Interval (Size)
#'
#' \code{ci_size} returns the confidence interval given a confidence level, sample size, mean and standard deviation.
#'
#' By default, the computation assumes that sample standard deviation is used - if using population standard deviation (where it is known or given), set \code{unknown_pop_sd} to \code{FALSE}.
#'
#' \code{confidence_level} accepts values for both frequency as well as probabilities.
#'
#' @param confidence_level value, e.g. \code{95} for 95\% confidence level
#' @param sample_size integer, e.g. \code{30}
#' @param mean integer, e.g. \code{10}
#' @param pop_sd value, e.g. \code{3.14}
#' @param unknown_pop_sd boolean, e.g. \code{FALSE} (defaults to \code{TRUE}  otherwise)
#' @examples
#' ci_size(0.95,30,10,3,TRUE)
ci_size = function(confidence_level,sample_size,mean,pop_sd,unknown_pop_sd=TRUE)
{
  proper_p = ((confidence_level + (100-confidence_level)/2)/100)

  if (unknown_pop_sd){
    half_int = qt(proper_p, sample_size-1)*pop_sd/sqrt(sample_size)
  }
  else{
    half_int = qnorm(proper_p)*pop_sd/sqrt(sample_size)
  }
  cat("Lower Limit: ", mean-half_int, "\n")
  cat("Upper Limit: ", mean+half_int, "\n")
}
