#' @title Compute Backwards Time of an Instant Relative to the Present
#'
#' @description This function computes the backwards time of an
#'   instant relative to the present moment (the time of the most
#'   recent sequenced sample) in the specified units.
#'
#' @param instant A POSIXct object representing the instant for which
#'   the backwards time is to be computed.
#'
#' @param present An object like that returned by \code{get_present}.
#'   This object serves as the reference point (the 'present moment')
#'   for calculating the backwards time.
#'
#' @param units A character string specifying the units of the result.
#'
#' @details The function calculates the time difference between the
#'   provided "instant" and the "present" time point. The result is
#'   returned in the specified "units". If "instant" is later than
#'   "present", the function will return a negative value because it
#'   works in backwards time.
#'
#' @return A numeric value representing the backwards time of the
#'   instant in the specified units. This value will be negative if
#'   the "instant" is in the future relative to "present".
#'
#' @seealso
#' \code{\link{get_present}}
#'
#' @export
bwd_time_from_instant <- function(instant, present, units) {
  i0 <- present$date_time
  i1 <- instant

  num_secs <- as.numeric(lubridate::as.duration(i0 - i1))
  if (all(i0 >= i1)) {
    if (units == "days") {
      return(num_secs / (60 * 60 * 24))
    } else {
      stop("not implemented yet.")
    }
  } else {
    ## Talking about time in the future
    stop("not implemented yet.")
  }
}
