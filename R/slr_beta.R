#'Create a matrix of slr model coefficients
#'
#'slr_beta( ) fits simple linear regression (slr) model to given predictor variable and response variable.
#'The function returns a matrix containing the intercept and the slope of the model, their standard errors, and
#'the t statistics and p-values for determining whether the intercept and the slope are significantly different from 0.
#'
#'@usage slr_beta(x, y)
#'
#'@param x a vector containing all the predictors
#'@param y a vector containing all the responses
#'
#'@section Note:
#'The order of elements in the vectors must match.
#'That is, the i-th element of x vector and the i-th element of y vector should be a paired observation of (X,Y).
#'
#'@return A matrix with 2 rows and 4 columns. Each entry is a number.
#'
#'@section See Also:
#'The function that evaluates the overall fitness of the slr model: slr_rsquared( ).
#'
#'@examples
#'## Use two randomly generated vectors as arguments
#'## Observations are (5.68, 4.17), (7.11, 5.99), (9.50,7.87), (10.61,8.63),
#'## (16.17, 10.23), (14.53, 14.89), (17.33, 16.32)
#'slr_beta(x = c(5.68, 7.11, 9.50, 10.61, 16.17, 14.53, 17.33),
#'             y = c(4.17, 5.99, 7.87, 8.63, 10.23, 14.89, 16.32))
#'## Use the R built-in "iris" dataset
#'## Model the response variable Petal.Length as a linear function of the
#'## predictor variable Petal.width
#'slr_beta(x = iris$Petal.Width, y = iris$Petal.Length)
#'
#'@export
#'

slr_beta <- function(x, y) {
  mean_x = mean(x)
  mean_y = mean(y)

  #Calculate the value of beta0 and beta1
  SSXY = sum((x - mean_x) * (y - mean_y))
  SSX = sum(x * (x - mean_x))
  beta1 = SSXY / SSX
  beta0 = mean_y - beta1 * mean_x

  #Calculate the standard error of beta0 and beta1
  n = length(x)
  MSE = sum((y - (beta0 + beta1 * x)) ^ 2) / (n - 2)
  var_hat_beta0_hat = MSE * (1 / n + mean_x ^ 2 / SSX)
  var_hat_beta1_hat = MSE / SSX
  se_beta0 = sqrt(var_hat_beta0_hat)
  se_beta1 = sqrt(var_hat_beta1_hat)

  #Calculate the t statistics for beta0 and beta1
  t_statistic_beta0 = beta0 / sqrt(var_hat_beta0_hat)
  t_statistic_beta1 = beta1 / sqrt(var_hat_beta1_hat)

  #Calculate the p-values corresponding to the t statistics
  p_beta0 = 2 * pt(abs(t_statistic_beta0), n - 2, lower.tail = FALSE)
  p_beta1 = 2 * pt(abs(t_statistic_beta1), n - 2, lower.tail = FALSE)

  #Make the result matrix
  result = matrix(c(beta0, beta1, se_beta0, se_beta1, t_statistic_beta0, t_statistic_beta1, p_beta0, p_beta1),
    nrow = 2, ncol = 4)
  rownames(result) = c("beta0", "beta1")
  colnames(result) = c("Estimate", "Std. Error", "t statistic", "p-value")
  return(result)
}
