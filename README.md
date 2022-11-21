
<!-- README.md is generated from README.Rmd. Please edit that file -->

# slrmodel

<!-- badges: start -->

[![R-CMD-check](https://github.com/lyvqian/slrmodel/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lyvqian/slrmodel/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/lyvqian/slrmodel/branch/main/graph/badge.svg)](https://app.codecov.io/gh/lyvqian/slrmodel?branch=main)
<!-- badges: end -->

## Overview

The simple linear regression model
$Y_i={\beta_0}+{\beta_1}X_i+{\epsilon_i}$ is a model that summarizes the
relationship between an independent variable `X` (predictor) and a
dependent variable `Y` (response). ${\beta_0}$ and ${\beta_1}$ are
usually unknown and need to be estimated using observed data
(X<sub>1</sub>,Y<sub>1</sub>), (X<sub>2</sub>,Y<sub>2</sub>),…,
(X<sub>n</sub>,Y<sub>n</sub>), and ${\epsilon_i}$ is a random error
term.

Deriving the estimators ${\hat{\beta_0}}$ and ${\hat{\beta_1}}$ by the
method of least squares would help to obtain the fitted model
${\hat{Y}}={\hat{\beta_0}}+{\hat{\beta_1}}X$ (equivalently,
$Y_i={\hat{\beta_0}}+{\hat{\beta_1}}X_i+{\hat{\epsilon_i}}$). The model
is considered to best approximate the (X,Y) relationship, and thus
${\hat{Y}}={\hat{\beta_0}}+{\hat{\beta_1}}X$ is also called the euqation
of best-fitting line.

The goal of slrmodel is to calculate ${\hat{\beta_0}}$ and
${\hat{\beta_1}}$ using the method of least squares, test the
significance of (X,Y) association under the fitted model
${\hat{Y}}={\hat{\beta_0}}+{\hat{\beta_1}}X$, and compute the proportion
of variation in Y that is explained by the model.

- `slr_beta()` creates a matrix of coefficients of the fitted model.
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

This is a basic example which shows you how to use the slrmodel package.
The built-in dataset `iris` is employed.

``` r
library(slrmodel)

slr_beta(iris$Petal.Width,iris$Petal.Length) #slr_beta(x, y)
#>       Estimate Std. Error t statistic      p-value
#> beta0 1.083558 0.07296696    14.84998 4.043318e-31
#> beta1 2.229940 0.05139623    43.38724 4.675004e-86

slr_rsquared(iris$Petal.Width,iris$Petal.Length) #slr_rsquared(x, y)
#> [1] 0.9271098
```

Both `slr_beta()` and `slr_rsquared()` have two arguments, `x` and `y`.
`x` is a vector containing all observed predictors, while `y` is a
vector containing all corresponding responses. In this case, `x` is a
vector containing all values of petal widths of iris flowers, and `y` is
a vector containing all values of petal lengths of iris flowers.

The result of `slr_beta()` is a matrix with 2 rows and 4 columns. The
upper row provides ${\hat{\beta_0}}$, the standard error of ${\beta_0}$,
the t statistic for testing whether ${\hat{\beta_0}}$ significantly
differs from 0, and the p value for determining the significance. The
lower row provides the same coefficients for ${\hat{\beta_1}}$.

The result of `slr_rsquared()` is R<sup>2</sup>, the coefficient of
determination. It tells the proportion of variation in `Y` that is
explained by the ${\hat{Y}}={\hat{\beta_0}}+{\hat{\beta_1}}X$ model.

With ${\hat{\beta_0}}$ and ${\hat{\beta_1}}$, we can plot the best
fitting line, which is ${\hat{Y}}=1.08+2.23X$ in this example: ![Image
text](https://github.com/lyvqian/slrmodel/raw/966ab6c6d02df3051a7209f65406d8c561e646f4/man/figures/README-unnamed-chunk-3-1.png)
