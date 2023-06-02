test_that("basic examples work", {
  tmp1 <- fwd_day_times_a(as.Date("2023-04-02") + c(4,3,3,0,0));
  tmp2 <- c(4 + 1/3, 3 + 2/3, 3 + 1/3, 2/3, 1/3);
  expect_equal(tmp1, tmp2)
})
