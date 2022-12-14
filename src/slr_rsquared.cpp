#include <Rcpp.h>
using namespace Rcpp;

//' Return the coefficient of determination of the fitted slr model
//'
//' @name slr_rsquared
//'
//' @description slr_rsquared( ) fits simple linear regression (slr) model to given predictor variable and response variable. It returns the coefficient of determination (R squared) of the model. The coefficient of determination evaluates the proportion of variance in the response that can be explained by the predictor, indicating the overall fitness of the model.
//'
//' @usage slr_rsquared(x, y)
//'
//' @param x  a vector containing all the predictors
//' @param y  a vector containing all the responses
//'
//' @section Note:
//' The order of elements in the vectors must match.
//' That is, the i-th element of x vector and the i-th element of y vector should be a paired observation of (X,Y).
//'
//' @return A decimal number that is typically larger than 0 and smaller than 1.
//'
//' @section See Also:
//' The function that gives the key coefficients (intercept and slope) of the fitted slr model: slr_beta( ).
//'
//' @examples
//' ## Use two randomly generated vectors as arguments
//' ## Observations are (5.68, 4.17), (7.11, 5.99), (9.50,7.87), (10.61,8.63),
//' ## (16.17, 10.23), (14.53, 14.89), (17.33, 16.32)
//' slr_rsquared(x = c(5.68, 7.11, 9.50, 10.61, 16.17, 14.53, 17.33),
//'              y = c(4.17, 5.99, 7.87, 8.63, 10.23, 14.89, 16.32))
//'
//' ## Use the R built-in "iris" dataset
//' ## Model the response variable Petal.Length as a linear function of the
//' ## predictor variable Petal.width
//' slr_rsquared(x = iris$Petal.Width, y = iris$Petal.Length)
//'
//' @export
//'

// [[Rcpp::export]]
double slr_rsquared(NumericVector x, NumericVector y){
  double mean_x=mean(x);
  double mean_y=mean(y);
  int n=y.size();
  // Calculate beta0 and beta1
  double SSXY=0.0;
  for (int i=0; i<n; i++){
    SSXY+=(x[i]-mean_x)*(y[i]-mean_y);
  }
  double SSX=0.0;
  for (int i=0; i<n; i++){
    SSX+=(x[i]-mean_x)*(x[i]-mean_x);
  }
  double beta1=SSXY/SSX;
  double beta0=mean_y-beta1*mean_x;

  // Calculate SSY, the denominator of R squared
  double SSY=0.0;
  for (int i=0; i<n; i++){
    SSY+=(y[i]-mean_y)*(y[i]-mean_y);
  }

  // Calculate SSR, the numerator of R squared
  double SSR=0.0;
  for (int i=0;i<n;i++){
     SSR+=(beta0+beta1*x[i]-mean_y)*(beta0+beta1*x[i]-mean_y);
  }

  // Calculate r squared and return the value
  double r_squared=SSR/SSY;
  return r_squared;
}
