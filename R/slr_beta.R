#'slr_beta
#'
#'Gets the coefficients of the simple linear regression model
#'
#'@param x,y input value
#'
#'@return the coefficients of linear regression model for predictor x and response y
#'
#'@examples
#'slr_beta(c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14),c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69))
#'
#'@export
#'

slr_beta<-function(x,y){
  mean_x=mean(x)
  mean_y=mean(y)

  ##Calculate the value of beta0 and beta1
  SSXY=sum((x-mean_x)*(y-mean_y))
  SSX=sum(x*(x-mean_x))
  beta1=SSXY/SSX
  beta0=mean_y-beta1*mean_x

  ##Calculate the t statistics for coefficient
  n=length(x)
  MSE=sum((y-(beta0+beta1*x))^2)/(n-2)
  var_hat_beta0_hat=MSE*(1/n+mean_x^2/SSX)
  var_hat_beta1_hat=MSE/SSX
  t_statistic_beta0=beta0/sqrt(var_hat_beta0_hat)
  t_statistic_beta1=beta1/sqrt(var_hat_beta1_hat)

  ##Calculate the p-values corresponding to the t statistics
  p_beta0=2*pt(abs(t_statistic_beta0),n-2,lower.tail=FALSE)
  p_beta1=2*pt(abs(t_statistic_beta1),n-2,lower.tail=FALSE)

  ##Make a result matrix
  result=matrix(c(beta0,beta1,t_statistic_beta0,t_statistic_beta1,p_beta0,p_beta1),nrow=2,ncol=3)
  rownames(result)=c("beta0","beta1")
  colnames(result)=c("Estimate","t statistic","p value")
  return(result)
}
