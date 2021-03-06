% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic_stats.R
\name{key_stats}
\alias{key_stats}
\title{Key Statistics (Unweighted)}
\usage{
key_stats(x)
}
\arguments{
\item{x}{vector, e.g. \code{c(1,2,3,4)}}
}
\value{
\itemize{
\item Expectation/Mean
\item Population Variance and Standard Deviation
\item Sample Variance and Standard Deviation
\item Interquartile Range
}
}
\description{
\code{key_stats} returns the expectation/mean, population, interquartile range and sample variance and standard deviations from an unweighted vector (equal probabilities/distribution).
}
\examples{
key_stats(c(1,2,3,4))
key_stats(c(2,3,4,4))
}
\seealso{
\code{\link{weighted_stats}} for calculating x with non-uniform distribution.
}
