test_that("basic example", {
  week_start_dates <-
    lubridate::ymd("2023-08-13") + lubridate::days((0:9) * 7)
  week_end_dates <-
    week_start_dates + lubridate::days(6)

  weekly_data <- data.frame(
    week_start = week_start_dates,
    week_end = week_end_dates,
    count = c(1,2,3,4,5,6,7,8,9,18)
  )

  daily_data_expected <-
    data.frame(
      date = seq(from = min(weekly_data$week_start),
                 to = max(weekly_data$week_end),
                 by = 1),
      count = c(c(0,0,0,1,0,0,0),
                c(0,0,0,1,1,0,0),
                c(0,0,1,1,1,0,0),
                c(0,0,1,1,1,1,0),
                c(0,1,1,1,1,1,0),
                c(0,1,1,1,1,1,1),
                c(1,1,1,1,1,1,1),
                c(1,1,1,2,1,1,1),
                c(1,1,1,2,2,1,1),
                c(2,2,3,3,3,3,2))
    )

  daily_data_computed <- spread_across_days(weekly_data)

  expect_equal(daily_data_computed, daily_data_expected)
})
