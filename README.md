

This package aims to assist students taking level 1000 Introduction to Statistics courses by adding in handy functions for the beginner to R.

The functions written are based on the author's own experience with the Nanyang Business School's module AB1202 Statistics and Analysis, with the goal of obtaining fast solutions to purely computational questions. As far as possible, the package has been written to include a fast solution to every possible question involving pure calculations.

While no R knowledge is expected, the user should note that this vignette and the corresponding package assumes an elementary understanding of basic statistics theory.

### Setup

Setup should be easy. First, install the package by running two lines to code, one after the other.

```r
install.packages("devtools")
devtools::install_github("shunyao643/ab1202ay2021")
```

To load the package, run the following code before you begin calling functions from it.

```{r setup}
library(ab1202ay2021)
```

To assist the user in making use of the package, they may choose to access this document with `browseVignettes("ab1202ay2021")` or alternatively, access the documentation for each of the functions by adding a ? prefix, e.g. `?key_stats`.



## Manual

### Key Stats

`key_stats()` is an essential function that you may choose to rely upon to work with a set of data. The basis statistics course often places an emphasis on mean, standard deviation as well as variance, and as such, this function has been written to return the expectation/mean, population and sample variance and standard deviations from an unweighted vector (equal probabilities/distribution).

The concept of vector may be difficult to grasp, so you may simply choose to understand it as a list of values. Unweighted just means that every value in this list has an equal chance of being chosen.

Here is an example:

```{r}
# Finds the key stats
x <- c(1,2,3,4)
key_stats(x)
key_stats(c(1,2,3,4))
```

The astute reader would recognise that the information returned is exactly the same - this is intentional to demonstrate that all functions would work whether you choose to assign it to a variable or not. This is true for many R functions as well.

### Weighted Stats

The cousin to `key_stats()` is `weighted_stats()`. This function should be used where there are repeated occurrences of a certain value, or when the probability is given instead.

A situation where this may be preferred is for the following situation: 

| Number of cards in the average wallet | Frequency |
|:-----|---------|
|    1 |    10   |
|    3 |    10   |
|    4 |    20   |

```{r}
# Finds the weighted stats
weighted_stats(c(2,3,4), c(10,10,20))
```

Alternatively,

```{r}
weighted_stats(c(2,3,4), c(0.25,0.25,0.5))
```

### Population Standard Deviation and Variance

If you wish to simply obtain the population standard deviation (`sd_pop`) or variance (`var_pop`), these functions can be called in a similar fashion as above.

```{r}
# Finds the population standard deviation
sd_pop(c(1,2,3,4))
# Finds the population variance
var_pop(c(1,2,3,4))
```

### Hypothesis Testing

A key component of inferential statistics is Hypothesis Testing. The function `hypo` will take a series of values (`x_bar`, `mu`, `sd` or standard deviation, `sample_size`) in order to return an appropriate p-value. 

By default, the computation assumes that sample standard deviation is used - if using population standard deviation (where it is known or given), set `unknown_pop_sd` to `FALSE`.

Similarly, the computation assumes that the one-tail test is used - if using the two-tail test, set `one-tail` to `FALSE`.

Here's how to use this for a sample problem:

_A researcher wants to determine if the population mean is greater than 45. A random sample of 36 observations yields a sample mean of 47. Assume that the population standard deviation is 8.5._

```{r}
hypo(TRUE,FALSE,47,45,8.5,36)
```

The argument names are entirely optional. You can choose to omit it as above, or alternatively, press `TAB` as you key in the values to have it automatically filled in for you.

Where the question requires one to check if the null hypothesis should be rejected, the `rej` function can be used as well. 

Continuing from the previous question, 

_At the 5% significance level, what is the conclusion?_

```{r}
rej(0.07900963,5)
```
Note that there should be no conversion between percentage and decimal. This is to accommodate percentage values smaller than 1\%, e.g. 0.5\%.


### Confidence Intervals

`ci_size` returns the confidence interval given a confidence level, sample size, mean and standard deviation.

By default, the computation assumes that sample standard deviation is used - if using population standard deviation (where it is known or given), set \code{unknown_pop_sd} to \code{FALSE}.

Here's a sample application.

_IQ tests are designed to yield scores that are approximately normally distributed. A reporter gathers the IQ scores from 22 employees of a firm and records the sample mean IQ as 106. She assumes that the population standard deviation is 15. Compute a 90% confidence interval for the average IQ in this firm._

```{r}
ci_size(90,22,106,15,FALSE)
```
