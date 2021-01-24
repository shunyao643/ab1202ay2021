#' Standard Deviation (Population)
#'
#' \code{sd_pop} computes the standard deviation of the values in \code{x} with the denominator value \emph{n}, unlike the implementation as in \code{\link[stats]{sd}}.
#'
#' @param x vector, e.g. \code{c(1,2,3,4)}
#' @seealso \code{\link{var_pop}} for its square and  \code{\link[stats]{sd}} for the default \code{stats} package variant with denominator \emph{n-1}.
#' @examples
#' sd_pop(c(1,2,3,4))
sd_pop = function(x)
{
  return(sqrt(var(x) * (length(x) - 1) / length(x)))
}

#' Variance (Population)
#'
#' \code{var_pop} computes the variance of the values in \code{x} with the denominator value \emph{n}, unlike the implementation as in \code{\link[stats]{var}}.
#'
#' @param x vector, e.g. \code{c(1,2,3,4)}
#' @seealso \code{\link{sd_pop}} for its root and  \code{\link[stats]{var}} for the default \code{stats} package variant with denominator \emph{n-1}.
#' @examples
#' var_pop(c(1,2,3,4))
var_pop = function(x)
{
  return(var(x) * (length(x) - 1) / length(x))
}

#' Key Statistics (Unweighted)
#'
#' \code{key_stats} returns the expectation/mean, population, interquartile range and sample variance and standard deviations from an unweighted vector (equal probabilities/distribution).
#'
#' @param x vector, e.g. \code{c(1,2,3,4)}
#' @return \itemize{
#' \item Expectation/Mean
#' \item Population Variance and Standard Deviation
#' \item Sample Variance and Standard Deviation
#' \item Interquartile Range
#' }
#' @seealso \code{\link{weighted_stats}} for calculating x with non-uniform distribution.
#' @examples
#' key_stats(c(1,2,3,4))
#' key_stats(c(2,3,4,4))
key_stats = function(x)
{
  POP_SIZE = length(x)
  POP_VAR = (var(x)*(POP_SIZE-1)/POP_SIZE)

  cat("# of data points   : ", POP_SIZE, "\n")
  cat("Expectation/Mean   : ", mean(x), "\n\n")
  cat("Population Variance: ", POP_VAR, "\n")
  cat("Population Std Dev : ", POP_VAR**0.5, "\n")
  cat("Sample Variance: ", var(x), "\n")
  cat("Sample Std Dev : ", var(x)**0.5, "\n")
  cat("IQR: ", IQR(x), "\n")
}

#' Key Statistics (Weighted)
#'
#' \code{weighted_stats} returns the expectation/mean, population variance and standard deviations from a weighted vector (differing probabilities/distribution).
#'
#' \code{probabilities} accepts values for both frequency as well as probabilities.
#'
#' @param x vector of values, e.g. \code{c(2,3,4)}
#' @param p vector of probabilities/frequencies, e.g. \code{c(1,1,2)} or \code{c(0.25,0.25,0.5)}
#' @return \itemize{
#' \item Expectation/Mean
#' \item Population Variance and Standard Deviation
#' }
#' @seealso \code{\link{key_stats}} for calculating x with a uniform distribution.
#' @examples
#' weighted_stats(c(2,3,4), c(1,1,2))
#' weighted_stats(c(2,3,4), c(0.25,0.25,0.5))
weighted_stats = function(x,p)
{
  if(length(x)!=length(p)){
    return("Vector lengths do not match up!")
  } # checks that there is a corresponding probability/distribution
  if(sum(p)!=1){
    p = p / sum(p)
  } # expresses frequencies as probabilities

  POP_SIZE = length(x)
  EXMEAN = weighted.mean(x,p)
  POP_VAR = sum(p * (x - EXMEAN)^2)

  cat("Number of unique data points: ", POP_SIZE, "\n")
  cat("Expectation/Mean   : ", EXMEAN, "\n")
  cat("Population Variance: ", POP_VAR, "\n")
  cat("Standard Deviation : ", POP_VAR**0.5, "\n")
}


