#include <Rcpp.h>
using namespace Rcpp;

// This is a simple function using Rcpp that creates an R list
// containing a character vector and a numeric vector.
//
// Learn more about how to use Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//
// and browse examples of code using Rcpp at:
//
//   http://gallery.rcpp.org/
//

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
