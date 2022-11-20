
<!-- README.md is generated from README.Rmd. Please edit that file -->

# slrmodel

<!-- badges: start -->

[![R-CMD-check](https://github.com/lyvqian/slrmodel/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lyvqian/slrmodel/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/lyvqian/slrmodel/branch/main/graph/badge.svg)](https://app.codecov.io/gh/lyvqian/slrmodel?branch=main)
<!-- badges: end -->

## Overview

The simple linear regression model $y={\beta_0}+{\beta_1}x+{\epsilon}$
is a model that summarizes the relationship between an independent
variable `x` (predictor) a dependent variable `y` (response).
${\beta_0}$ and ${\beta_1}$ are usually unknown and need to be estimated
using observed data (x<sub>1</sub>,y<sub>1</sub>),
(x<sub>2</sub>,y<sub>2</sub>),…, (x<sub>n</sub>,y<sub>n</sub>), and
${\epsilon}$ is a random error term. Deriving the estimators
${\hat{\beta_0}}$ and ${\hat{\beta_1}}$ by the method of least squares
would help to obtain the best-fitting line
${\hat{y}}={\hat{\beta_0}}+{\hat{\beta_1}}x$, that is, the straight line
demonstrating the best approximation of the given set of data.

The goal of slrmodel is to calculate the ${\hat{\beta_0}}$ and
${\hat{\beta_1}}$ using the method of least squares, test the
significance of (x,y) association, and evaluate the overall fitness of
the ${\hat{y}}={\hat{\beta_0}}+{\hat{\beta_1}}x$ model.

- `slr_beta()` creates a matrix of coefficients of the best fitting
  line.
- `slr_rsquared()` calculates the coefficient of determination
  R<sup>2</sup>.

## Installation

You can install the development version of slrmodel from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lyvqian/slrmodel")
```

## Usage

This is a basic example which shows you how to use the slrmodel package:

``` r
library(slrmodel)

slr_beta(iris$Petal.Length,iris$Petal.Width) #slr_beta(x, y)
#>         Estimate  Std. Error t statistic      p-value
#> beta0 -0.3630755 0.039761990   -9.131221 4.699798e-16
#> beta1  0.4157554 0.009582436   43.387237 4.675004e-86

slr_rsquared(iris$Petal.Length,iris$Petal.Width) #slr_rsquared(x, y)
#> [1] 0.9271098
```

Both `slr_beta()` and `slr_rsquared()` have two arguments, `x` and `y`.
`x` is a vector containing all observed predictors, while `y` is a
vector containing all corresponding responses.

The result of `slr_beta()` is a matrix with 2 rows and 4 columns. The
upper row provides ${\hat{\beta_0}}$, the standard error of ${\beta_0}$,
the t statistic for testing whether ${\hat{\beta_0}}$ significantly
differs from 0, and the p value for determining the significance. The
lower row provides the same coefficients for ${\hat{\beta_1}}$.

The result of `slr_rsquared()` is R<sup>2</sup>, the coefficient of
determination. It tells the proportion of variation in `y` that is
explained by the ${\hat{y}}={\hat{\beta_0}}+{\hat{\beta_1}}x$ model.

With ${\hat{\beta_0}}$ and ${\hat{\beta_1}}$, we can plot the best
fitting line, which is ${\hat{y}}=-0.363+0.416x$ in this example:

<img src="man/figures/README-pressure-1.png" width="100%" />
