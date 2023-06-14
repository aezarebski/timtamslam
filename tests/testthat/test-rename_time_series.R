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
