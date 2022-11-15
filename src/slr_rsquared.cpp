#include <Rcpp.h>
using namespace Rcpp;

//' slr_rsquared
//'
//' @name slr_rsquared
//'
//' @description Gets the coefficients of the simple linear regression model
//'
//' @param x Predictor
//' @param y Response
//'
//' @return the r squared of linear regression model for predictor x and response y
//'
//' @examples
//' slr_rsquared(c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14),c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69))
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
