#' Annotate the time series with the backward times of the count data
#' assuming counts are attributed to midday on the day of sampling.
#'
#' @param present a result from `get_present`
#' @param time_series A data frame with columns `date` and `count`
#'
#' @export
rename_time_series <- function(present, time_series) {
  offset <- present$hours / 24 - 1 / 2
  bwd_days <- as.numeric(as.Date(present$date) - as.Date(time_series$date))
  time_series$bwd_times <- bwd_days + offset
  return(time_series)
}
