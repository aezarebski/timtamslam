#' Get the hours, minutes, and seconds from a fraction of a day.
#'
#' @export
get_hms_str <- function(frac_day) {
  if (frac_day < 0 | frac_day >= 1) {
    stop("frac_day must be between 0 (inclusive) and 1 (exclusive)")
  }

  frac_hours <- 24 * frac_day
  num_hours_int <- floor(frac_hours)
  num_minutes_int <- floor(60 * (frac_hours %% 1))
  num_seconds_int <- round(60 * ((60 * (frac_hours %% 1)) %% 1))
  return(paste0(c(num_hours_int,
                  num_minutes_int,
                  num_seconds_int),
                collapse = ":"))
}
