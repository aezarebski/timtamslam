#' @title Extract Hours, Minutes, and Seconds from a Fraction of a Day
#'
#' @description This function takes a fraction of a day as input and returns a
#' string representation of the equivalent hours, minutes, and seconds.
#'
#' @param frac_day A numeric value representing a fraction of a day.
#' This value must be in the range [0, 1).
#'
#' @details This function multiplies the fraction of the day by 24 to convert
#' it into hours, and then breaks down the fractional part of the hours
#' into minutes and seconds. The result is formatted as a string "H:M:S".
#'
#' @return A string in the format "H:M:S" representing the input fraction
#' of the day.
#'
#' @examples
#' \dontrun{
#'   get_hms_str(0.5) # Returns "12:00:00", which is the middle of the day
#' }
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
  return(sprintf("%02d:%02d:%02d",
                 num_hours_int,
                 num_minutes_int,
                 num_seconds_int))
}
