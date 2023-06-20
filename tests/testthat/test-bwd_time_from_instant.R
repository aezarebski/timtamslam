test_that("simple example", {
  present <- list(
    date = as.Date("2023-08-04"),
    hours = (2/3) * 24,
    date_time = lubridate::ymd_hms("2023-08-04 16:00:00")
  )

  instant_1 <- lubridate::ymd_hms("2023-08-03 16:00:00")
  bwd_time_val_1 <- bwd_time_from_instant(instant_1, present, "days")
  bwd_time_goal_1 <- 1.0
  expect_equal(bwd_time_val_1, bwd_time_goal_1, tolerance = 1e-6)

  instant_2 <- lubridate::ymd_hms("2023-08-04 07:00:00")
  bwd_time_val_2 <- bwd_time_from_instant(instant_2, present, "days")
  bwd_time_goal_2 <- (16 - 7) / 24
  expect_equal(bwd_time_val_2, bwd_time_goal_2, tolerance = 1e-6)
})

test_that("vectorization", {

  present_date_time <- lubridate::ymd_hms("2023-08-04 16:00:00")
  present <- list(
    date = as.Date("2023-08-04"),
    hours = (2/3) * 24,
    date_time = present_date_time
  )

  num_days <- 0:2
  instants <- present_date_time - lubridate::days(num_days)
  bwd_time_val <- bwd_time_from_instant(instants, present, "days")
  bwd_time_goal <- num_days
  expect_equal(bwd_time_val, bwd_time_goal, tolerance = 1e-6)
})
