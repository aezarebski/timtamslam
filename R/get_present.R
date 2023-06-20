#' Extract the date and time of the most recent sequence.
#'
#' BEAST2 uses the time of the most recent sequence as the present so
#' it is helpful to be able to extract this information.
#'
#' @param seqs_dated A DNAbin object with dates.
#' @param seqs_timed A DNAbin object with times.
#'
#' @return A list with three elements: date, hours (time of last
#'   sequenced sample) and a \code{date_time} which contains the
#'   instant of time as a single object.
#'
#' @examples
#'
#' # see documentation for \code{rename_time_series}.
#'
#' @export
get_present <- function(seqs_dated, seqs_timed) {
  last_date <- max(lubridate::ymd(extract_dates(seqs_dated)))
  last_time <- max(as.numeric(extract_times(seqs_timed)))

  frac_day <- last_time %% 1
  frac_hours <- 24 * frac_day
  time_str <- get_hms_str(frac_day)
  return(
    list(
      date = last_date,
      hours = frac_hours,
      date_time = lubridate::ymd_hms(paste0(last_date, " ", time_str))
    )
  )
}
