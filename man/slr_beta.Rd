% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slr_beta.R
\name{slr_beta}
\alias{slr_beta}
\title{Create a matrix of slr model coefficients}
\usage{
slr_beta(x, y)
}
\arguments{
\item{x}{a vector containing all the predictors}

\item{y}{a vector containing all the responses}
}
\value{
A matrix with 2 rows and 4 columns. Each entry is a number.
}
\description{
slr_beta( ) fits simple linear regression (slr) model to given predictor variable and response variable.
The function returns a matrix containing the intercept and the slope of the model, their standard errors, and
the t statistics and p-values for determining whether the intercept and the slope are significantly different from 0.
}
\section{Note}{

The order of elements in the vectors must match.
That is, the i-th element of x vector and the i-th element of y vector should be a paired observation of (X,Y).
}

\section{See Also}{

The function that evaluates the overall fitness of the slr model: slr_rsquared( ).
}

\examples{
## Use two randomly generated vectors as arguments
## Observations are (5.68, 4.17), (7.11, 5.99), (9.50,7.87), (10.61,8.63),
## (16.17, 10.23), (14.53, 14.89), (17.33, 16.32)
slr_beta(x = c(5.68, 7.11, 9.50, 10.61, 16.17, 14.53, 17.33),
            y = c(4.17, 5.99, 7.87, 8.63, 10.23, 14.89, 16.32))

## Use the R built-in "iris" dataset
## Model the response variable Petal.Length as a linear function of the
## predictor variable Petal.width
slr_beta(x = iris$Petal.Width, y = iris$Petal.Length)

}
