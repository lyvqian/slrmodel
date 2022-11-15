test_that("multiplication works", {
  data(iris)
  standard1=summary(lm(Sepal.Length~Sepal.Width,data=iris))$r.squared
  expect_equal(slr_rsquared(iris$Sepal.Width,iris$Sepal.Length),standard1)
  data(mtcars)
  standard2=summary(lm(qsec~hp,data=mtcars))$r.squared
  expect_equal(slr_rsquared(mtcars$hp,mtcars$qsec),standard2)
  data(trees)
  standard3=summary(lm(Height~Girth,data=trees))$r.squared
  expect_equal(slr_rsquared(trees$Girth,trees$Height),standard3)
})
