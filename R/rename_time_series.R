#' Annotate the time series with the backward times
#'
#' Annotate the time series with the backward times of the count data
#' assuming counts are attributed to midday on the day of sampling.
#'
#' @param present a result from `get_present`
#' @param time_series A data frame with columns `date` and `count`
#'
#' @examples
#'
#' path_input_csv <- system.file("testdata",
#'                               "demo-time-series.csv",
#'                               package = "timtamslamR")
#'
#' present <- list(date = as.Date("2023-08-04"), hours = 22.399992)
#'
#' time_series_calendar <- read.csv(path_input_csv)
#' time_series_timed <-
#'   rename_time_series(present, time_series_calendar)
#'
#' @export
rename_time_series <- function(present, time_series) {
  if (!"date" %in% colnames(time_series)) {
    stop("time_series must have a column named 'date'")
  }
  offset <- present$hours / 24 - 1 / 2
  bwd_days <- as.numeric(as.Date(present$date) - as.Date(time_series$date))
  time_series$bwd_times <- bwd_days + offset
  return(time_series)
}
