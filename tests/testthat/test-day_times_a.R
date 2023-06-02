test_that("basic examples work", {
  expect_equal(day_times_a(1), 1/3)
  expect_equal(day_times_a(2), c(1/3, 2/3))
  expect_equal(day_times_a(3), c(1/5, 2/5, 3/5))
  expect_equal(day_times_a(4), c(1/5, 2/5, 3/5, 4/5))
})
