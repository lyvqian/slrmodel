test_that("multiplication works", {
  ## test using iris data, modeling sepal widths (predictor) with sepal lengths (response).
  data(iris)
  standard1=summary(lm(Sepal.Length~Sepal.Width,data=iris))$r.squared
  expect_equal(slr_rsquared(iris$Sepal.Width,iris$Sepal.Length),standard1)

  ## test using mtcars data, modeling gross horsepower (predictor) with 1/4 mile time (response).
  data(mtcars)
  standard2=summary(lm(qsec~hp,data=mtcars))$r.squared
  expect_equal(slr_rsquared(mtcars$hp,mtcars$qsec),standard2)

  ## test using trees data, modeling tree diameter (girth) with tree height (response).
  data(trees)
  standard3=summary(lm(Height~Girth,data=trees))$r.squared
  expect_equal(slr_rsquared(trees$Girth,trees$Height),standard3)
})
