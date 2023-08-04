test_that("basic example", {
  expect_equal(get_hms_str(0.0625), "01:30:00")
  expect_equal(get_hms_str(0.25), "06:00:00")
  expect_equal(get_hms_str(0.5), "12:00:00")
})
