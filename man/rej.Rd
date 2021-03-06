% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hypo.R
\name{rej}
\alias{rej}
\title{Hypothesis Rejection}
\usage{
rej(pvalue, significance_level)
}
\arguments{
\item{pvalue}{value, e.g. \code{0.045}}

\item{significance_level}{value, e.g. \code{5} for 5\% confidence level}
}
\description{
\code{rej} is the lazy way to check whether the hypothesis should be rejected or accepted at the specified significance level based on the p-value.
}
\examples{
rej(0.045, 5)
}
\seealso{
\url{https://en.wikipedia.org/wiki/Statistical_hypothesis_testing}
}
