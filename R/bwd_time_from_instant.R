#' Backwards time of an instant relative to the present.
#'
#' Compute the backwards time of an instant relative to the present in
#' the specified units.
#'
#' @param instant a POSIXct object representing an instant.
#' @param present an object like that returned by \code{get_present}.
#' @param units a character string specifying the units of the result.
#'
#' @return a numeric value representing the backwards time of the
#'   instant.
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
