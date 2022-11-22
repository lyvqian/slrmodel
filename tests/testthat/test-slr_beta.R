test_that("slr_beta works", {
  ## element-by-element test using iris data
  data(iris)
  standard = summary(lm(Sepal.Length ~ Sepal.Width, data = iris))$coefficients
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[1, 1], standard[1, 1])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[2, 1], standard[2, 1])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[1, 2], standard[1, 2])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[2, 2], standard[2, 2])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[1, 3], standard[1, 3])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[2, 3], standard[2, 3])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[1, 4], standard[1, 4])
  expect_equal(slr_beta(iris$Sepal.Width, iris$Sepal.Length)[2, 4], standard[2, 4])

})
