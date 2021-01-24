#' Hypothesis Testing
#'
#' \code{hypo} returns test statistic (\emph{z or t-value}), location of \code{x_bar} on the graph (relative to centre), which test is used and the corresponding \code{p-value}.
#'
#' By default, the computation assumes that sample standard deviation is used - if using population standard deviation (where it is known or given), set \code{unknown_pop_sd} to \code{FALSE}.
#'
#' Similarly, the computation assumes that the one-tail test is used - if using the two-tail test, set \code{one-tail} to \code{FALSE}.
#'
#' @param one_tail boolean value for type of test, e.g. \code{FALSE} (defaults to \code{TRUE}  otherwise)
#' @param unknown_pop_sd boolean, e.g. \code{FALSE} (defaults to \code{TRUE}  otherwise)
#' @param x_bar value, e.g. \code{30}
#' @param mu value, e.g. \code{32}
#' @param sd value, e.g. \code{3.14}
#' @param sample_size integer, e.g. \code{30}
#' @return Returns the \code{p-value}.
#' @examples
#' hypo(TRUE, TRUE, 30, 32, 5, 30)
hypo = function(one_tail = TRUE,unknown_pop_sd = TRUE, x_bar, mu, sd, sample_size){
  if(mu == x_bar)
    return ("Error: mu cannot be equal to the x_bar!")
  zt_value = (x_bar - mu)/(sd / sqrt(sample_size))
  if(zt_value>0){ #IMPLIES ON THE RIGHT
    cat("value found on the right side", "\n")
  }
  else{ #IMPIES ON THE LEFT
    cat("value found on the left side", "\n")
  }
  if(unknown_pop_sd == TRUE){
    cat("t-test test statistic:", zt_value, "\n")
    zt_value = abs(zt_value)
    if(one_tail == TRUE){ #ONE TAIL TEST
      p_value = 1 - pt(zt_value,sample_size-1)
    }
    else{ #TWO TAIL TEST
      p_value = 2*(1 - pt(zt_value,sample_size-1))
    }
  }
  else{
    cat("z-test test statistic:", zt_value, "\n")
    zt_value = abs(zt_value)
    if(one_tail == TRUE){ #ONE TAIL TEST
      p_value = 1 - pnorm(zt_value)
    }
    else{ #TWO TAIL TEST
      p_value = 2*(1 - pnorm(zt_value))
    }
  }
  cat("p_value:", p_value, "\n")
  return (p_value)
}

#' Hypothesis Rejection
#'
#' \code{rej} is the lazy way to check whether the hypothesis should be rejected or accepted at the specified significance level based on the p-value.
#'
#' @param pvalue value, e.g. \code{0.045}
#' @param significance_level value, e.g. \code{5} for 5\% confidence level
#' @seealso \url{https://en.wikipedia.org/wiki/Statistical_hypothesis_testing}
#' @examples
#' rej(0.045, 5)
rej = function(pvalue, significance_level)
{
  if (pvalue < significance_level/100){
    cat("Reject H0, sufficient evidence")
  }
  else
  {
    cat("Do not reject H0, insufficient evidence")
  }
}
