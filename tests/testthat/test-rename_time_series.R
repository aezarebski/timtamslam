test_that("basic example", {

  ## Test the function on a larger simulated dataset to check it
  ## produces the expected output.
  path_input_csv <- system.file("testdata",
                                "demo-time-series.csv",
                                package = "timtamslamR")
  path_output_csv <- system.file("testdata",
                                 "demo-time-series-time-stamped.csv",
                                 package = "timtamslamR")
  present <- list(
    date = as.Date("2023-08-04"),
    hours = 22.399992
  )

  time_series_calendar <- read.csv(path_input_csv)
  time_series_timed <-
    rename_time_series(present, time_series_calendar)

  time_series_goal <- read.csv(path_output_csv)
  expect_equal(time_series_timed, time_series_goal)
})

test_that("incorrect header throws error", {

  time_series_calendar_good <-
    data.frame(date = as.Date("2023-08-03") + 0:5,
               size = 0:5)
  time_series_calendar_bad <-
    data.frame(date_str = as.Date("2023-08-03") + 0:5,
               size = 0:5)

  present <- list(
    date = as.Date("2023-08-04"),
    hours = 22.399992
  )

  expect_s3_class(
    rename_time_series(present, time_series_calendar_good),
    "data.frame"
  )
  expect_error(rename_time_series(present, time_series_calendar_bad))
})
